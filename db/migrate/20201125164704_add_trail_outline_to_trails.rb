class AddTrailOutlineToTrails < ActiveRecord::Migration[6.0]
  def change
    add_column :trails, :trail_outline, :text
  end
end
