class AcademicLevelsController < ApplicationController

  before_action :admin, except: []

  def courses
    academic_level = AcademicLevel.where(id: params[:id]).first
    if academic_level.nil?
      render json: {message: 'Academic level not found', status: 400}
    else
      render_for_api :public,
                     json: academic_level.courses
    end
  end

  def teachers
    academic_level = AcademicLevel.where(id: params[:id]).first
    teachers = academic_level.teachers.group_id if academic_level
    if teachers.nil?
      render json: {message: 'Academic level not found', status: 400}
    elsif teachers.empty?
      render json: {message: 'There is no teacher in this level', status: 400}
    else
      render_for_api :teacher,
                     json: teachers
    end
  end

  def students
    academic_level = AcademicLevel.where(id: params[:id]).first
    if academic_level.nil?
      render json: {message: 'Academic level not found', status: 400}
    else
      render_for_api :student,
                     json: academic_level.students
    end
  end

  def academic_year
    academic_level = AcademicLevel.where(id: params[:id]).first
    if academic_level.nil?
      render json: {message: 'Academic level not found', status: 400}
    else
      render_for_api :public, json: academic_level.academic_year
    end
  end

  def create
    academic_year = AcademicYear.where(id: params[:academic_year_id]).first
    if academic_year.nil?
      render json: {message: 'Academic year not found', status: 400}
    else
      academic_level = AcademicLevel.new(name: params[:name], academic_year: academic_year)
      if academic_level.save
        render json: {academic_level: academic_level, status: 200}
      else
        render json: {message: academic_level.errors, status: 400}
      end
    end
  end
end
