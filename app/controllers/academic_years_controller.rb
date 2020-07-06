class AcademicYearsController < ApplicationController

  before_action :admin, except: []

  def index
    render_for_api :public, json: AcademicYear.all
  end

  def levels
    academic_year = AcademicYear.find(params[:id])
    render_for_api :academic_levels, json: academic_year.academic_levels
  end

  def create
    academic_year = AcademicYear.new(academic_year_params)
    if academic_year.save
      render json: {academic_year: academic_year, status: 200}
    else
      render json: {message: academic_year.errors, status: 400}
    end
  end

  private

  def academic_year_params
    params.require(:academic_year).permit(:name, :year)
  end
end
