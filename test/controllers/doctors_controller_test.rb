require 'test_helper'

class DoctorsControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

end
