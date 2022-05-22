require "test_helper"

class LogindisplayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get logindisplay_index_url
    assert_response :success
  end
end
