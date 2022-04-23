require "test_helper"

class Public::SpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_spots_new_url
    assert_response :success
  end
end
