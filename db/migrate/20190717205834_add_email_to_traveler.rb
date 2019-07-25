class AddEmailToTraveler < ActiveRecord::Migration[5.2]
  def change
    add_column :travelers, :email, :string
  end
end
