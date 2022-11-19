require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get landing_page" do
    get sessions_landing_page_url
    assert_response :success
  end

  test "should get dashboard" do
    get sessions_dashboard_url
    assert_response :success
  end
end
