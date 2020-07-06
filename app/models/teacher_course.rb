class TeacherCourse < ApplicationRecord
  acts_as_api
  belongs_to :teacher
  belongs_to :academic_level_course

  api_accessible :public do |user|
    user.add :academic_level_course
  end

end
