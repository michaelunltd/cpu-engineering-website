class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.actable
      t.string :title
      t.string :image
      t.string :content
      t.boolean :featured, default: false

      t.timestamps null: false
    end
  end
end
