class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.integer 'user_id'
      t.integer 'semester_id'
      t.timestamps
    end
    add_index('students', 'semester_id')
  end
end
