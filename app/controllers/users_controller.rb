class UsersController < ApplicationController

  before_action :admin, except: ['profile']

  def index
    @users = User.all
    render_for_api :public, json: @users, root: :users
  end

  def show_admins
    @admins = User.admins
    render_for_api :public, json: @admins, root: :users
  end

  def show_students
    @students = User.students
    render_for_api :public, json: @students, root: :students
  end

  def profile
    if @current_user.student?
      render_for_api :student, json: @current_user, root: :user
    elsif @current_user.teacher?
      render_for_api :teacher, json: @current_user, root: :user
    else
      render_for_api :public, json: @current_user, root: :user
    end

    # @content = {
    #     user: user
    # }
    #
    # render json: { :responce => @content, :status => 200 }
  end
end
