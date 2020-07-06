class CreateTeacherCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_courses do |t|
      t.integer 'teacher_id'
      t.integer 'academic_level_course_id'
      t.timestamps
    end
    add_index('teacher_courses', 'teacher_id')
    add_index('teacher_courses', 'academic_level_course_id')
  end
end
