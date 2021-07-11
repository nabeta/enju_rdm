class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_and_datasets, dependent: :destroy
  has_many :datasets, through: :collection_and_datasets

  include AttrJson::Record
  attr_json :title, :string
  attr_json :creators, Agent.to_type, array: true
  attr_json :description, :string
end

# == Schema Information
#
# Table name: collections
#
#  id              :uuid             not null, primary key
#  json_attributes :jsonb
#  user_id         :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
