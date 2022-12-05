require "test_helper"

class LocalitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get localities_index_url
    assert_response :success
  end

  test "should get show" do
    get localities_show_url
    assert_response :success
  end

  test "should get edit" do
    get localities_edit_url
    assert_response :success
  end

  test "should get update" do
    get localities_update_url
    assert_response :success
  end

  test "should get new" do
    get localities_new_url
    assert_response :success
  end

  test "should get create" do
    get localities_create_url
    assert_response :success
  end

  test "should get destroy" do
    get localities_destroy_url
    assert_response :success
  end
end
