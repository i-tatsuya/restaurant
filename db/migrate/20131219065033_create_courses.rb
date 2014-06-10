class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :price
      t.string :details
      t.timestamps
    end
    add_index :courses,:id
  end
end
