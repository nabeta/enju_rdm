require "test_helper"

class DatasetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dataset = FactoryBot.create(:dataset)
    login_as(users(:one))
  end

  test "should get index" do
    get datasets_url
    assert_response :success
  end

  test "should get new" do
    get new_dataset_url
    assert_response :success
  end

  test "should create dataset" do
    assert_difference('Dataset.count') do
      post datasets_url, params: { dataset: { title: @dataset.title } }
    end

    assert_redirected_to dataset_url(Dataset.order(created_at: :desc).first)
  end

  test "should show dataset" do
    get dataset_url(@dataset)
    assert_response :success
  end

  test "should get edit" do
    get edit_dataset_url(@dataset)
    assert_response :success
  end

  test "should update dataset" do
    patch dataset_url(@dataset), params: { dataset: { title: @dataset.title, user_id: @dataset.user_id } }
    assert_redirected_to dataset_url(@dataset)
  end

  test "should destroy dataset" do
    assert_difference('Dataset.count', -1) do
      delete dataset_url(@dataset)
    end

    assert_redirected_to datasets_url
  end
end
