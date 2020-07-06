class CoursesController < ApplicationController

  before_action :admin, except: []

  def index
    @courses = Course.all
    render_for_api :public, json: @courses
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: {course: course, status: 200}
    else
      render json: {message: course.errors, status: 400}
    end
  end


  def destroy
    course = Course.where("id = #{params[:id]}").first
    if course.nil?
      render json: {message: 'Course not found', status: 404}
    elsif course.destroy
      render json: {message: "Course #{course.name} was destroyed", status: 200}
    else
      render json: {message: course.errors, status: 400}
    end
  end

  def destroy_courses
    unless params[:ids]
      render json: {message: 'You need to send courses ids', status: 400}
      return
    end
    courses = Course.where(id: params[:ids])
    if courses.nil? || courses.empty?
      render json: {message: 'Course not found', status: 404}
    elsif courses.destroy_all
      render json: {message: "Courses with ids ( #{params[:ids].join(', ')} ) was destroyed", status: 200}
    else
      render json: {message: courses.errors, status: 400}
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

end
