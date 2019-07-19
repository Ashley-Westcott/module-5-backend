class CreateTravelers < ActiveRecord::Migration[5.2]
  def change
    create_table :travelers do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.string :photo
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
