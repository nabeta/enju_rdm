require "test_helper"

class CreatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: creators
#
#  id          :uuid             not null, primary key
#  dataset_id  :uuid             not null
#  name        :string           not null
#  orcid       :string
#  ror         :string
#  affiliation :string
#  role        :integer          default(1), not null
#  position    :integer          default(1), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
