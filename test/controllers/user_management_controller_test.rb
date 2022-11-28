require "test_helper"

class UserManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_management_index_url
    assert_response :success
  end

  test "should get show" do
    get user_management_show_url
    assert_response :success
  end

  test "should get destroy" do
    get user_management_destroy_url
    assert_response :success
  end
end
