class AcademicYear < ApplicationRecord
  acts_as_api
  has_many :academic_levels

  api_accessible :public do |year|
    year.add :id
    year.add :name
    year.add :year
  end
end
