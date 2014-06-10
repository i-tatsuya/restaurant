class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :hashed_password, null: false
      t.string :address, null: false
      t.string :mail_address, null: false
      t.string :phone_number, null: false
      t.date :birthday, null: false
      t.boolean :administrator,null: false,default: false
      t.timestamps
    end
    add_index :users, :user_name
  end
end
