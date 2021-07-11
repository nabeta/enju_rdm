class Thumbnail < ApplicationRecord
  belongs_to :dataset
  belongs_to :fileset
end

# == Schema Information
#
# Table name: thumbnails
#
#  id         :uuid             not null, primary key
#  dataset_id :uuid             not null
#  fileset_id :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
