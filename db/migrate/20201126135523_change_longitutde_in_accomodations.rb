class ChangeLongitutdeInAccomodations < ActiveRecord::Migration[6.0]
  def change
    rename_column :accomodations, :longitutde, :longitude
  end
end
