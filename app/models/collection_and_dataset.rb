class CollectionAndDataset < ApplicationRecord
  belongs_to :collection
  belongs_to :dataset
end

# == Schema Information
#
# Table name: collection_and_datasets
#
#  id            :uuid             not null, primary key
#  collection_id :uuid             not null
#  dataset_id    :uuid             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
