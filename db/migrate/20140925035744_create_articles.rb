class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.date :published_at
      t.text :content
      t.string :picture

      t.timestamps
    end
  end
end
