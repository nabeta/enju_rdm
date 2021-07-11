require "test_helper"

class CollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection = FactoryBot.create(:collection)
    login_as(users(:one))
  end

  test "should get index" do
    get collections_url
    assert_response :success
  end

  test "should get new" do
    get new_collection_url
    assert_response :success
  end

  test "should create collection" do
    assert_difference('Collection.count') do
      post collections_url, params: { collection: { title: @collection.title } }
    end

    assert_redirected_to collection_url(Collection.order(created_at: :desc).first)
  end

  test "should show collection" do
    get collection_url(@collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_collection_url(@collection)
    assert_response :success
  end

  test "should update collection" do
    patch collection_url(@collection), params: { collection: { json_attributes: @collection.json_attributes, user_id: @collection.user_id } }
    assert_redirected_to collection_url(@collection)
  end

  test "should destroy collection" do
    assert_difference('Collection.count', -1) do
      delete collection_url(@collection)
    end

    assert_redirected_to collections_url
  end
end
