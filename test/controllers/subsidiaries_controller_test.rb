require "test_helper"

class SubsidiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subsidiary_index_url
    assert_response :success
  end

  test "should get show" do
    get subsidiary_show_url
    assert_response :success
  end

  test "should get new" do
    get subsidiary_new_url
    assert_response :success
  end

  test "should get create" do
    get subsidiary_create_url
    assert_response :success
  end

  test "should get edit" do
    get subsidiary_edit_url
    assert_response :success
  end

  test "should get update" do
    get subsidiary_update_url
    assert_response :success
  end
end
