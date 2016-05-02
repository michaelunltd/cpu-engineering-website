class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :about
      t.string :mission
      t.string :vision
      t.string :logo
      
      t.timestamps null: false
    end
  end
end
