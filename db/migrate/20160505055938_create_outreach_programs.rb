class CreateOutreachPrograms < ActiveRecord::Migration
  def change
    create_table :outreach_programs do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
