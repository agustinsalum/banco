require "test_helper"

class TurnsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get turns_index_url
    assert_response :success
  end

  test "should get show" do
    get turns_show_url
    assert_response :success
  end
end
