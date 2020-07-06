class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.integer 'user_id'
      t.timestamps
    end
    add_index('teachers', 'user_id')
  end
end
