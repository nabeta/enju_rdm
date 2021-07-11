FactoryBot.define do
  factory :thumbnail do
    dataset { nil }
    fileset { nil }
  end
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
