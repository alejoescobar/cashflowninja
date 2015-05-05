require 'test_helper'

class CalendarsControllerTest < ActionController::TestCase
  test "should get monthly" do
    get :monthly
    assert_response :success
  end

end
