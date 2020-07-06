class User < ApplicationRecord
  extend Enumerize
  acts_as_api
  has_secure_password
  belongs_to :role
  has_one :student
  has_one :teacher

  scope :admins, -> { where('role_id' => Role.where('name' => 'admin').first.id) }
  scope :students, -> { where('role_id' => Role.where('name' => 'student').first.id) }
  scope :teachers, -> { where('role_id' => Role.where('name' => 'teacher').first.id) }
  scope :supervisors, -> { where('role_id' => Role.where('name' => 'supervisor').first.id) }

  api_accessible :public do |user|
    user.add :full_name
    user.add :username
    user.add :email
    user.add :role, template: :public
  end

  api_accessible :student do |user|
    user.add :full_name
    user.add :username
    user.add :email
    user.add :student, template: :public, as: 'details'
  end

  def student
    {
        id: id,
        name: full_name,
        username: username,
        email: email
    }
  end

  api_accessible :student_no_details do |user|
    user.add :full_name
    user.add :username
    user.add :email
  end

  api_accessible :teacher do |user|
    user.add :full_name
    user.add :username
    user.add :email
    # user.add :teacher, template: :public, as: 'details'
  end

  api_accessible :teacher_d do |user|
    user.add :full_name
    user.add :username
    user.add :email
  end


  def full_name
    first_name.to_s << ' ' << last_name.to_s
  end

  def admin?
    role_id == 5
  end

  def student?
    role_id == 2
  end

  def teacher?
    role_id == 3
  end
end
