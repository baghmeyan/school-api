class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.integer 'student_id'
      t.integer 'academic_level_id'
      t.float 'grade'
      t.timestamps
    end
    add_index('grades', 'student_id')
    add_index('grades', 'academic_level_id')
  end
end
