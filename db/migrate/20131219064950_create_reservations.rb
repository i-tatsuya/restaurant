class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, null: false
      t.date :date,null: false
      t.integer :time,null: false
      t.integer :persons, null: false
      t.references :course, null: false
      t.text :message
      t.references :service
      t.references :memorial
      t.timestamps
    end
    add_index :reservations,:id,unique: true,name: 'id_index'
    add_index :reservations,:date,name: 'date_index'
    add_index :reservations,:user_id
    add_index :reservations,:course_id
    add_index :reservations,:service_id
    add_index :reservations,:memorial_id
  end
end
