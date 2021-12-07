require "test_helper"

class PublisherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: publishers
#
#  id         :uuid             not null, primary key
#  dataset_id :uuid             not null
#  name       :string           not null
#  ror        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
