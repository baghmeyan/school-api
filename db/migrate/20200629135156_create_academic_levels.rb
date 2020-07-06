class CreateAcademicLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_levels do |t|
      t.integer 'academic_year_id'
      t.string 'name', null: false
      t.timestamps
    end
    add_index('academic_levels', 'academic_year_id')
  end
end
