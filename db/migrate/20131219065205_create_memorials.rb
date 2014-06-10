class CreateMemorials < ActiveRecord::Migration
  def change
    create_table :memorials do |t|
      t.string :memorial_id
      t.string :memorial_name
      t.float :memorial_rate
      t.timestamps
    end
  end
end
