class CreateTrailStages < ActiveRecord::Migration[6.0]
  def change
    create_table :trail_stages do |t|
      t.string :name
      t.integer :stage_number
      t.float :longitude
      t.float :latitude
      t.integer :distance_from_last
      t.integer :ascend_from_last
      t.integer :descend_from_last
      t.references :trail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
