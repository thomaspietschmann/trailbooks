class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :country
      t.integer :distance
      t.integer :number_of_days
      t.string :elevation_range

      t.timestamps
    end
  end
end
