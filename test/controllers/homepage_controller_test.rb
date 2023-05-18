require "test_helper"

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get report" do
    get homepage_report_url
    assert_response :success
  end
end
