class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.string :img_path
      t.string :author

      t.timestamps null: false
    end
  end
end
