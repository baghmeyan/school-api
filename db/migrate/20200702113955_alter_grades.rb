class AlterGrades < ActiveRecord::Migration[6.0]
  def up
    remove_column(:grades, :grade)
    add_column(:grades, :first_exam, :float)
    add_column(:grades, :second_exam, :float)
    add_column(:grades, :final_exam, :float)
    add_column(:grades, :school_work, :float)
  end

  def down
    remove_column(:grades, :first_exam, :float)
    remove_column(:grades, :second_exam, :float)
    remove_column(:grades, :final_exam, :float)
    remove_column(:grades, :school_work, :float)
    add_column(:grades, :grade, :float)
  end
end
