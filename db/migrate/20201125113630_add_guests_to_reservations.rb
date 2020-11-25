class AddGuestsToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :guests, :integer
  end
end
