class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true
      t.date :checkin_date
      t.float :total_price
      t.boolean :booked

      t.timestamps
    end
  end
end
