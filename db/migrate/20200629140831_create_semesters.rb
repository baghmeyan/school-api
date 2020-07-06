class CreateSemesters < ActiveRecord::Migration[6.0]
  def change
    create_table :semesters do |t|
      t.string 'name'
      t.integer 'academic_level_id'
      t.timestamps
    end
    add_index('semesters', 'academic_level_id')
  end
end
