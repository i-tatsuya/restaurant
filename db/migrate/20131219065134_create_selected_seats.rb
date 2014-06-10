class CreateSelectedSeats < ActiveRecord::Migration
  def change
    create_table :selected_seats do |t|
      t.integer :reservation_id
      t.integer :seat_id
      t.timestamps
    end
    add_index :selected_seats,:reservation_id
    add_index :selected_seats,:seat_id
  end
end
