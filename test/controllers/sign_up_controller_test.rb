require 'test_helper'

class SignUpControllerTest < ActionController::TestCase
  test "should get business_users" do
    get :business_users
    assert_response :success
  end

  test "should get government_users" do
    get :government_users
    assert_response :success
  end

end
