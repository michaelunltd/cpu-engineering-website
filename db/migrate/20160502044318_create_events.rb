class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :venue
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps null: false
    end
  end
end
