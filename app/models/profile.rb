class Profile < ApplicationRecord
  validates :full_name, presence: true
  belongs_to :user
end

# == Schema Information
#
# Table name: profiles
#
#  id         :uuid             not null, primary key
#  full_name  :string           not null
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
