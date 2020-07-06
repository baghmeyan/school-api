class GradesController < ApplicationController

  before_action :teacher

  def create
    if can_add_update_delete?
      grade = Grade.new(grade_params)
      if grade.save
        render json: {grade: grade}, status: 200
      else
        render json: {message: grade.errors}, status: 400
      end
    else
      render json: {error: 'Not Authorized'}, status: 401
    end
  end

  def update
    if can_add_update_delete?
      grade = Grade.where(id: params[:id]).first
      if grade.nil?
        render json: {message: 'Grade not found'}, status: 404
      else
        grade.update_attributes(update_grade_params)
        if grade.save
          render json: {grade: grade}, status: 200
        else
          render json: {message: grade.errors}, status: 400
        end
      end
    else
      render json: {error: 'Not Authorized'}, status: 401
    end
  end

  private

  def can_add_update_delete?
    bool_academic_level = false
    bool_student = false
    @current_user.teacher.academic_level_courses.each { |t| bool_academic_level = true if t.id == params[:grade][:academic_level_id] }
    @current_user.teacher.students.each { |s| bool_student = true if s.id == params[:grade][:student_id] }
    bool_student && bool_academic_level
  end

  def grade_params
    params.require(:grade).permit(:student_id, :academic_level_id,
                                  :first_exam, :second_exam, :final_exam, :school_work)
  end

  def update_grade_params
    params.require(:grade).permit(:first_exam, :second_exam, :final_exam, :school_work)
  end

end
