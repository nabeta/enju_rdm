require "test_helper"

class FilesetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fileset = FactoryBot.create(:fileset)
    login_as(users(:one))
  end

  test "should get index" do
    get filesets_url
    assert_response :success
  end

  test "should get new" do
    get new_fileset_url
    assert_response :success
  end

  test "should create fileset" do
    assert_difference('Fileset.count') do
      post filesets_url, params: { fileset: { dataset_id: @fileset.dataset_id } }
    end

    assert_redirected_to fileset_url(Fileset.order(created_at: :desc).first)
  end

  test "should show fileset" do
    get fileset_url(@fileset)
    assert_response :success
  end

  test "should get edit" do
    get edit_fileset_url(@fileset)
    assert_response :success
  end

  test "should update fileset" do
    patch fileset_url(@fileset), params: { fileset: { dataset_id: @fileset.dataset_id } }
    assert_redirected_to fileset_url(@fileset)
  end

  test "should destroy fileset" do
    assert_difference('Fileset.count', -1) do
      delete fileset_url(@fileset)
    end

    assert_redirected_to filesets_url
  end
end
