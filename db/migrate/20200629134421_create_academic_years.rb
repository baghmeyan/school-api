class CreateAcademicYears < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_years do |t|
      t.string 'name', null: false
      t.date 'year', null: false
      t.timestamps
    end
  end
end
