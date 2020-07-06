require 'test_helper'

class AcademicYearsControllerTest < ActionDispatch::IntegrationTest
  test "should get academic_levels" do
    get academic_years_academic_levels_url
    assert_response :success
  end

end
