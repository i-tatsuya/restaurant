class CreateMemorialHasServices < ActiveRecord::Migration
  def change
    create_table :memorial_has_services do |t|
      t.references :memorial, null: false
      t.references :service, null: false
      t.timestamps
    end
  end
end
