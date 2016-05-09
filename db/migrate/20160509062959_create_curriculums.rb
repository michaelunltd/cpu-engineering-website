class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string :name
      t.string :attachment
      t.belongs_to :department
      t.timestamps null: false
    end
  end
end
