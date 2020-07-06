class TeachersController < ApplicationController

  before_action :teacher, except: []

  def courses
    if @current_user.teacher.academic_level_courses.empty?
      render json: {message: 'No courses found'}, status: 404
    else
      render_for_api :public, json: @current_user.teacher.academic_level_courses
    end
  end

  def students
    academic_level = AcademicLevel.where(id: params[:id]).first
    if academic_level.nil?
      render json: {message: 'Academic level not found'}, status: 404
    else
      if access_academic_level?(academic_level)
        render_for_api :student, json: academic_level.students
      else
        render json: {error: 'Not Authorized'},
               status: 401
      end
    end
  end

  def academic_levels
    render_for_api :academic_levels, json: @current_user.teacher.academic_levels.uniq
  end

  def access_academic_level?(academic_level)
    bool = false
    academic_level.teachers.group_id.each { |t| bool = true if t.id == @current_user.teacher.id }
    bool
  end

end
