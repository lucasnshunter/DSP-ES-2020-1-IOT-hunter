require 'test_helper'

class TesteControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get teste_home_url
    assert_response :success
  end

end
