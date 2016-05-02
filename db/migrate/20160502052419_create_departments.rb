class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.text :about
      t.text :message
      t.text :vision
      t.text :mission
      t.text :history
      t.string :logo
      t.timestamps null: false
    end
  end
end
