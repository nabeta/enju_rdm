require "test_helper"

class DatasetTest < ActiveSupport::TestCase
  setup do
    @dataset = FactoryBot.create(:fileset).dataset
  end

  test "export_to_ro_crate" do
    assert @dataset.export_to_ro_crate
  end

  test "to_jsonld" do
    assert @dataset.to_jsonld
  end
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
#  visibility      :integer          default("closed"), not null
#
