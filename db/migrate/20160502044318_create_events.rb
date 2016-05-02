class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :venue
      t.string :image
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps null: false
    end
  end
end
