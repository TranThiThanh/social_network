require 'test_helper'

class StaticPagesDemoControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_demo_home_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_demo_help_url
    assert_response :success
  end

end
