class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :service_number
      t.string :service_name
      t.timestamps
    end
  end
end
