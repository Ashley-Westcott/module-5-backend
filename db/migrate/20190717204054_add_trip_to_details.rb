class AddTripToDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :details, :trip, foreign_key: true
  end
end
