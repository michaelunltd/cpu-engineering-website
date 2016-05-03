class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :photo
      t.string :position
      t.string :honorifics
      t.text :counseling_hours

      t.timestamps null: false
    end
  end
end
