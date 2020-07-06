class SemestersController < ApplicationController

  before_action :admin, except: []

  def index
    semesters = Semester.all
    render_for_api :public, json: semesters
  end

  def create
    semester = Semester.new(semester_params)
    if semester.save
      render json: {semester: semester, status: 200}
    else
      render json: {message: semester.errors, status: 400}
    end
  end

  def students
    semester = Semester.where(id: params[:id]).first
    if semester.nil?
      render json: {message: 'Semester not found', status: 400}
    else
      students = semester.students
      users = []
      students.each { |s| users << s.user }
      render_for_api :public, json: users
      # render json: {students: users, status: 200}
    end
  end

  private

  def semester_params
    params.require(:semester).permit(:name, :academic_level_id)
  end
end
