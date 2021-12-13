FactoryBot.define do
  factory :dataset do
    association :user    
    title { 'Enju RDM test dataset' }
  end
end

# == Schema Information
#
# Table name: datasets
#
#  id                :uuid             not null, primary key
#  json_attributes   :jsonb            not null
#  user_id           :uuid             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  visibility        :integer          default("closed"), not null
#  title             :text             not null
#  alternative_title :text
#  description       :text
#  date_published    :date
#  resource_type     :integer          default("other"), not null
#  manuscript_type   :integer          default("na"), not null
#  language          :integer          default("english"), not null
#
