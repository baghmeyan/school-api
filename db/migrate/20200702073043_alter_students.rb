class AlterStudents < ActiveRecord::Migration[6.0]
  def up
    remove_index('students', 'semester_id')
    remove_column('students', 'semester_id')
  end

  def down
    add_column('students', 'semester_id', :integer)
    add_index('students', 'semester_id')
  end
end
