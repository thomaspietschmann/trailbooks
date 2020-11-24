class CreateAccomodations < ActiveRecord::Migration[6.0]
  def change
    create_table :accomodations do |t|
      t.string :name
      t.text :description
      t.string :host_email
      t.string :category
      t.boolean :toilets
      t.boolean :showers
      t.boolean :lunch_bag
      t.boolean :breakfast
      t.boolean :dinner
      t.float :longitude
      t.float :latitude
      t.float :price_per_night
      t.integer :capacity
      t.references :trail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
