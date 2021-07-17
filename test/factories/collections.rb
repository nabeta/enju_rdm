FactoryBot.define do
  factory :collection do
    title { "test" }
    association :user
  end
end

# == Schema Information
#
# Table name: collections
#
#  id              :uuid             not null, primary key
#  json_attributes :jsonb            not null
#  user_id         :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
