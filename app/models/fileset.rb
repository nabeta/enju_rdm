class Fileset < ApplicationRecord
  belongs_to :dataset
  has_one_attached :attachment
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
