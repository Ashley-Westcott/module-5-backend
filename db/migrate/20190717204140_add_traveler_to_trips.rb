class AddTravelerToTrips < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :traveler, foreign_key: true
  end
end
