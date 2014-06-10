class CreateCourseImgs < ActiveRecord::Migration
  def change
    create_table :course_imgs do |t|
      t.references :course , null: false
      t.binary :data
      t.string :content_type
      t.timestamps
    end
    add_index :course_imgs,:course_id
  end
end
