class Student < ApplicationRecord
  acts_as_api
  # belongs_to :semester
  has_and_belongs_to_many :semesters, join_table: 'semesters_students'
  has_many :academic_levels, through: :semesters
  has_many :courses, through: :academic_levels
  has_many :grades
  belongs_to :user

  api_accessible :public do |student|
    student.add :semesters
  end

  api_accessible :student do |student|
    student.add :id
    student.add 'user.student', as: 'user'
  end
end
