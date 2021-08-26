class CreateNearbyStations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearby_stations do |t|
      t.references :property, foreign_key: true
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
