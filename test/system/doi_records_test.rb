require "application_system_test_case"

class DoiRecordsTest < ApplicationSystemTestCase
  setup do
    @doi_record = FactoryBot.create(:doi_record)
    login_as(users(:one))
  end

  test "visiting the index" do
    visit doi_records_url
    assert_selector "h1", text: "Doi Records"
  end

  test "creating a Doi record" do
    visit doi_records_url
    click_on "New Doi Record"

    fill_in "Dataset", with: @doi_record.dataset_id
    fill_in "Identifier", with: '10.5555/1234'
    click_on "Create Doi record"

    assert_text "Doi record was successfully created"
    click_on "Back"
  end

  test "updating a Doi record" do
    visit doi_records_url
    click_on "Edit", match: :first

    fill_in "Dataset", with: @doi_record.dataset_id
    fill_in "Identifier", with: @doi_record.identifier
    click_on "Update Doi record"

    assert_text "Doi record was successfully updated"
    click_on "Back"
  end

  test "destroying a Doi record" do
    visit doi_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Doi record was successfully destroyed"
  end
end
