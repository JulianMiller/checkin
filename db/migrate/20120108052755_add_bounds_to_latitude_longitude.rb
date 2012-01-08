class AddBoundsToLatitudeLongitude < ActiveRecord::Migration
  def change
    add_column :events, :min_latitude, :float
    add_column :events, :max_latitude, :float
    add_column :events, :min_longitude, :float
    add_column :events, :max_longitude, :float
  end
end
