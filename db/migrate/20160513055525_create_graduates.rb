class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :photo
      t.string :year_graduated
      t.text :awards
      t.belongs_to :department, index:true
      t.timestamps null: false
    end
  end
end
