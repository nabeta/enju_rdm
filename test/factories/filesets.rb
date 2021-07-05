FactoryBot.define do
  factory :fileset do
    association :dataset

    after(:build) do |fileset|
      fileset.attachment.attach(io: File.open("#{Rails.root}/README.md"), filename: 'README.md')
    end
  end
end

# == Schema Information
#
# Table name: filesets
#
#  id         :uuid             not null, primary key
#  dataset_id :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
