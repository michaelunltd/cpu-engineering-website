class CreateLinkages < ActiveRecord::Migration
  def change
    create_table :linkages do |t|
      t.string :name
      t.string :description
      t.string :image
      t.belongs_to :department, index:true
      t.timestamps null: false
    end
  end
end
