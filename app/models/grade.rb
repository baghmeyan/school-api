class Grade < ApplicationRecord
  acts_as_api
  belongs_to :student
  belongs_to :academic_level_course, { foreign_key: 'academic_level_id'}
  has_one :course, through: :academic_level_course
  validates :student_id, uniqueness: { scope: [:academic_level_course] }
  
  validates :first_exam, length: { maximum: 15 }
  validates :second_exam, length: { maximum: 15 }
  validates :final_exam, length: { maximum: 60 }
  validates :school_work, length: { maximum: 10 }

  api_accessible :public do |grade|
    grade.add :id
    grade.add :course
    grade.add :first_exam
    grade.add :second_exam
    grade.add :school_work
    grade.add :final_exam
  end
end
