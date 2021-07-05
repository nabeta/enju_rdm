FactoryBot.define do
  sequence :email do |i| "test#{i}@example.com" end
  factory :user do
    email { generate :email }
    password { 'testtest' }
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
