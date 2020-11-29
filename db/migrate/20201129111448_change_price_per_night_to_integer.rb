class ChangePricePerNightToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :accommodations, :price_per_night, :integer
  end
end
