class ApplicationController < ActionController::Base

  before_action :authenticate_request
  attr_reader :current_user
  skip_before_action :verify_authenticity_token

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def admin
    unless @current_user.admin?
      render json: {error: 'Not Authorized'},
             status: 401
    end
  end

  def teacher
    unless @current_user.teacher?
      render json: {error: 'Not Authorized'},
             status: 401
    end
  end

  def student
    unless @current_user.student?
      render json: {error: 'Not Authorized'},
             status: 401
    end
  end
end
