class CreateSemestersStudentsJoin < ActiveRecord::Migration[6.0]
  def change
    create_table :semesters_students, id: false do |t|
      t.integer 'semester_id'
      t.integer 'student_id'
    end
    add_index(:semesters_students, %w[semester_id student_id])
  end
end
