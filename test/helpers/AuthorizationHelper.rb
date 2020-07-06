# frozen_string_literal: true
module AuthorizationHelper
  def sign_up(user)
    # The argument 'user' should be a hash that includes the params 'email' and 'password'.
    post 'authentications/auth',
         params: { email: user[:email],
                   password: user[:password],
                   first_name: user[:first_name],
                   last_name: user[:last_name],
                   username: user[:username]},
         as: :json
  end

  def auth_tokens_for_user(user)
    # The argument 'user' should be a hash that includes the params 'email' and 'password'.
    post 'authentications/auth',
         params: { email: user[:email], password: user[:password] },
         as: :json
    # The three categories below are the ones you need as authentication headers.
    response.headers.slice('client', 'access-token', 'uid')
  end
end