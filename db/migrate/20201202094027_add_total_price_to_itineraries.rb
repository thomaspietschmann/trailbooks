class AddTotalPriceToItineraries < ActiveRecord::Migration[6.0]
  def change
    add_column :itineraries, :total_price, :integer
  end
end
