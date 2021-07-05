FactoryBot.define do
  sequence :identifier do |i| "10.5555/example#{i}" end
  factory :doi_record do
    identifier { generate :identifier }
    association :dataset
  end
end

# == Schema Information
#
# Table name: doi_records
#
#  id         :uuid             not null, primary key
#  identifier :string           not null
#  dataset_id :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
