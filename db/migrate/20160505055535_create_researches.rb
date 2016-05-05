class CreateResearches < ActiveRecord::Migration
  def change
    create_table :researches do |t|
      t.string :title
      t.text :summary
      t.string :group_name
      t.string :attachment
      t.belongs_to :department, index: true
      
      t.timestamps null: false
    end
  end
end
