require "test_helper"

class BidsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bids_create_url
    assert_response :success
  end
end
