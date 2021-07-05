require "application_system_test_case"

class FilesetsTest < ApplicationSystemTestCase
  setup do
    @fileset = FactoryBot.create(:fileset)
    login_as(users(:one))
  end

  test "visiting the index" do
    visit filesets_url
    assert_selector "h1", text: "Filesets"
  end

  test "creating a Fileset" do
    visit new_fileset_url

    fill_in "Dataset", with: @fileset.dataset_id
    attach_file 'fileset_attachment', Rails.root.join('README.md')
    click_on "Create Fileset"

    assert_text "Fileset was successfully created"
    click_on "Back"
  end

  test "updating a Fileset" do
    visit filesets_url
    click_on "Edit", match: :first

    fill_in "Dataset", with: @fileset.dataset_id
    click_on "Update Fileset"

    assert_text "Fileset was successfully updated"
    click_on "Back"
  end

  test "destroying a Fileset" do
    visit filesets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fileset was successfully destroyed"
  end
end
