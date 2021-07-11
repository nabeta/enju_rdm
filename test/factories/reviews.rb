FactoryBot.define do
  factory :review do
    association :dataset
    association :user
  end
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
