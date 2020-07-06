class CreateAcademicLevelCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_level_courses do |t|
      t.integer 'academic_level_id'
      t.integer 'course_id'
      t.timestamps
    end
    add_index('academic_level_courses', 'academic_level_id')
    add_index('academic_level_courses', 'course_id')
  end
end
