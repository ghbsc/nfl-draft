require 'test_helper'

class OwnershipsControllerTest < ActionController::TestCase
  test "should get draft" do
    get :draft
    assert_response :success
  end

  test "should get pick" do
    get :pick
    assert_response :success
  end

end
