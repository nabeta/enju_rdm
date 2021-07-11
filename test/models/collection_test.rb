require "test_helper"

class CollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: collections
#
#  id              :uuid             not null, primary key
#  json_attributes :jsonb
#  user_id         :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
