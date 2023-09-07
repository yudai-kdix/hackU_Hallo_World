require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get homes_new_url
    assert_response :success
  end

  test "should get about" do
    get homes_about_url
    assert_response :success
  end
end
