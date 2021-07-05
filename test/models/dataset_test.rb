require "test_helper"

class DatasetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: datasets
#
#  id              :uuid             not null, primary key
#  json_attributes :jsonb            not null
#  user_id         :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
