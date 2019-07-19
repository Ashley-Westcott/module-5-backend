class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :duration

      t.timestamps
    end
  end
end
