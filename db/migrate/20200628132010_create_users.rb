class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      # t.belongs_to :role ,foreign_key: true
      t.string 'first_name', limit: 20, null: false
      t.string 'last_name',  limit: 20, null: false
      t.string 'username',  limit: 40, null: false
      t.string 'email',  limit: 100, default: ''
      t.string 'password_digest'
      t.integer 'role_id', defaul: 1
      t.boolean 'is_active', default: false
      t.timestamps
    end
    add_index('users', 'role_id')
  end

  def down
    drop_table :users
  end
end
