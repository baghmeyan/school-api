require 'test_helper'

class AcademicLevelsControllerTest < ActionDispatch::IntegrationTest
  test "should get courses" do
    get academic_levels_courses_url
    assert_response :success
  end

  test "should get teachers" do
    get academic_levels_teachers_url
    assert_response :success
  end

  test "should get academic_year" do
    get academic_levels_academic_year_url
    assert_response :success
  end

end
