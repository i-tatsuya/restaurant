class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :contents
      t.date :start_date
      t.timestamps
    end
  end
end
