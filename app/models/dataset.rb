class Dataset < ApplicationRecord
  belongs_to :user
  has_many :filesets, dependent: :destroy
  has_one :thumbnail, dependent: :destroy
  has_one :doi_record
  has_many :collection_and_datasets, dependent: :destroy
  has_many :collections, through: :collection_and_datasets
  has_many :dataset_transitions, class_name: "DatasetTransition", autosave: false
  has_many :reviews, dependent: :destroy
  has_one_attached :attachment
  has_paper_trail only: [:json_attributes]

  enum visibility: { closed: 1, restricted: 2, open: 3 }

  include AttrJson::Record
  include AttrJson::NestedAttributes
  attr_json :title, :string
  attr_json :alternative_title, :string
  attr_json :publisher, :string
  attr_json :creators, Agent.to_type, array: true, default: [Agent.new]
  attr_json :description, :string
  attr_json :keywords, :string, array: true, default: []
  attr_json :language, :string
  attr_json :related_identifiers, RelatedIdentifier.to_type, array: true, default: [RelatedIdentifier.new]

  attr_json_accepts_nested_attributes_for :creators, :related_identifiers

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: 'false' do
      indexes :title, type: 'text'
    end
  end

  def as_indexed_json(options = {})
    attributes.symbolize_keys.slice(:id, :visibility) #.merge(title: title, visibility: visibility)
  end

  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: DatasetTransition,
    initial_state: :pending
  ]

  def state_machine
    @state_machine ||= DatasetStateMachine.new(self, transition_class: DatasetTransition)
  end

  def export_to_ro_crate
    crate = ROCrate::Crate.new
    filesets.each do |fileset|
      crate.add_file(ActiveStorage::Blob.service.path_for(fileset.attachment.key), fileset.attachment.filename.to_s)
    end

    Tempfile.create(id) do |f|
      Zip::File.open(f, Zip::File::CREATE) do |zip|
        crate.entries.each do |path, entry|
          next if entry.directory?
          zip.get_output_stream(path) { |s| entry.write(s) }
        end
      end

      attachment.attach(io: File.open(f), filename: "#{id}.zip")
    end

    attachment
  end
end

# == Schema Information
#
# Table name: datasets
#
#  id              :uuid             not null, primary key
#  json_attributes :jsonb            not null
#  user_id         :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  visibility      :integer          default("closed"), not null
#
