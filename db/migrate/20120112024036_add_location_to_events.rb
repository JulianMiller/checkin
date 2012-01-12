class AddLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :venue, :string
    add_column :events, :address, :string
  end
end
