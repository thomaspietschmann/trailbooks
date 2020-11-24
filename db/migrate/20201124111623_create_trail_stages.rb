class CreateTrailStages < ActiveRecord::Migration[6.0]
  def change
    create_table :trail_stages do |t|
      t.references :trail
      t.string :name
      t.integer :stage_number
      t.float :longitude
      t.float :latitude
      t.integer :distance_from_last
      t.integer :ascend_from_last
      t.integer :descend_from_last

      t.timestamps
    end
  end
end
