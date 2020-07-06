class AcademicLevel < ApplicationRecord
  acts_as_api
  belongs_to :academic_year
  has_many :academic_level_courses
  has_many :courses, through: :academic_level_courses
  has_many :teacher_courses, through: :academic_level_courses
  has_many :teachers, through: :teacher_courses
  has_one :semester
  has_many :semesters_students, through: :semester
  has_many :students, through: :semesters_students

  api_accessible :public do |level|
    level.add :id
    level.add :academic_year
    level.add :courses
  end

  api_accessible :academic_levels do |level|
    level.add :id
    level.add :name
  end
end
