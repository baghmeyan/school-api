require 'test_helper'

class AuthenticationsControllerTest < ActionDispatch::IntegrationTest
  include AuthorizationHelper
  test "should get auth" do
    user_one = {email: 'ammar1992ye@gmail.com', password: '123456'}
    # sign_up(user_one)
    # assert_response :success
    @auth_tokens = auth_tokens_for_user(user_one)
    assert_response :success
  end

  # def setup
  #   test_user = { email: 'user@test.com', password: 'testuser' }
  #   sign_up(test_user)
  #   @auth_tokens = auth_tokens_for_user(test_user)
  # end

end
