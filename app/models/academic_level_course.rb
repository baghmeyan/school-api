class AcademicLevelCourse < ApplicationRecord
  acts_as_api
  belongs_to :academic_level
  belongs_to :course
  has_many :grades
  has_many :teacher_courses
  has_many :teachers, through: :teacher_courses
  has_many :students, through: :academic_level

  scope :courses, lambda { |id| where("academic_level_id = #{id}") }

  api_accessible :public do |alc|
    alc.add :id
    alc.add :course
  end

  api_accessible :teacher do |alc|
    alc.add :id
    alc.add :teachers
  end
end
