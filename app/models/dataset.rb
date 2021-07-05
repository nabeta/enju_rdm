class Dataset < ApplicationRecord
  belongs_to :user
  has_many :filesets
  has_paper_trail only: [:json_attributes]

  include AttrJson::Record
  attr_json :title, :string
  attr_json :alternative_title, :string
  attr_json :publisher, :string
  attr_json :creators, :string, array: true
  attr_json :description, :string
  attr_json :keywords, :string, array: true
  attr_json :language, :string
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
#
