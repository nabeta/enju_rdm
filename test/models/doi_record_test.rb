require "test_helper"

class DoiRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
