class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :google_maps_info
      t.string :category
      t.string :notes
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
