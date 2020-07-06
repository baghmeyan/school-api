class StudentsController < ApplicationController

  before_action :admin, except: ['my_grades']
  before_action :student, only: ['my_grades']

  def index
    render_for_api :student, json: Student.all
  end

  def my_grades
    student = Student.find_by_user_id(@current_user.id)
    render_for_api :public, json: student.grades
  end

end
