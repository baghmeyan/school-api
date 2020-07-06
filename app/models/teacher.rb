class Teacher < ApplicationRecord
  acts_as_api
  has_many :teacher_courses
  # has_many :courses, :through => :teacher_courses
  has_many :academic_level_courses, through: :teacher_courses
  has_many :academic_levels, through: :academic_level_courses
  has_many :students, through: :academic_level_courses
  has_many :courses, through: :academic_level_courses
  belongs_to :user

  scope :group_id, -> {group(:id)}

  api_accessible :public do |teacher|
    teacher.add :teacher_courses, template: :public
  end

  api_accessible :teacher do |teacher|
    teacher.add :user
  end

end
