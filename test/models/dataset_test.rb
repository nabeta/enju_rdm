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

  test "state_machine" do
    assert_equal @dataset.state_machine.current_state, 'pending'
  end

  test "import_ro_crate" do
    @dataset.export_to_ro_crate
    assert Dataset.import_ro_crate(ActiveStorage::Blob.service.path_for(@dataset.attachment.key), user: @dataset.user)
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
