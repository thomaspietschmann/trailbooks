class ChangeNumberOfDaysToString < ActiveRecord::Migration[6.0]
  def change
    change_column :trails, :number_of_days, :string
  end
end
