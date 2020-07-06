class AuthenticationsController < ApplicationController

  skip_before_action :authenticate_request
  # skip_before_action :verify_authenticity_token

  def auth
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      @current_user = User.find_by_email(params[:email])
      render json: { auth_token: command.result, role: @current_user.role }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end