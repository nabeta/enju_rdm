require "test_helper"

class DoiRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doi_record = FactoryBot.create(:doi_record)
    login_as(users(:one))
  end

  test "should get index" do
    get doi_records_url
    assert_response :success
  end

  test "should get new" do
    get new_doi_record_url
    assert_response :success
  end

  test "should create doi_record" do
    assert_difference('DoiRecord.count') do
      dataset = FactoryBot.create(:dataset)
      post doi_records_url, params: { doi_record: { dataset_id: dataset.id, identifier: '10.5555/1234' } }
    end

    assert_redirected_to doi_record_url(DoiRecord.order(created_at: :desc).first)
  end

  test "should show doi_record" do
    get doi_record_url(@doi_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_doi_record_url(@doi_record)
    assert_response :success
  end

  test "should update doi_record" do
    patch doi_record_url(@doi_record), params: { doi_record: { dataset_id: @doi_record.dataset_id, identifier: @doi_record.identifier } }
    assert_redirected_to doi_record_url(@doi_record)
  end

  test "should destroy doi_record" do
    assert_difference('DoiRecord.count', -1) do
      delete doi_record_url(@doi_record)
    end

    assert_redirected_to doi_records_url
  end
end
