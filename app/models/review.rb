class Review < ApplicationRecord
  belongs_to :dataset
  belongs_to :user
end

# == Schema Information
#
# Table name: reviews
#
#  id         :uuid             not null, primary key
#  dataset_id :uuid             not null
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
