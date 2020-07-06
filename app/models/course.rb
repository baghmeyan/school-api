class Course < ApplicationRecord
  acts_as_api
  has_many :academic_level_courses
  has_many :academic_levels, through: :academic_level_courses

  # validates :name, presence: true, maximum: 255

  api_accessible :public do |course|
    course.add :id
    course.add :name
  end

end
