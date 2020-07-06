class CreateRole < ActiveRecord::Migration[6.0]
  def up
    create_table :roles do |t|

      t.string 'name', null: false
      t.string 'display_name', default: ''
    end
  end

  def down
    drop_table :roles
  end
end
