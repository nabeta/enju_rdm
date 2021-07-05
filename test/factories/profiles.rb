FactoryBot.define do
  factory :profile do
    full_name { 'test' }
    association :user
  end
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
