require 'test_helper'

class CercaControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get cerca_home_url
    assert_response :success
  end

end
