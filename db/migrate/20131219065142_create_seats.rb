class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :number
      t.integer :value
      t.timestamps
    end
  end
end
