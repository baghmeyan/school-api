class Semester < ApplicationRecord
  acts_as_api
  belongs_to :academic_level
  has_and_belongs_to_many :students, join_table: 'semesters_students'
  # has_many :students

  api_accessible :public do |semester|
    semester.add :id
    semester.add :name
    semester.add :academic_level
  end

end
