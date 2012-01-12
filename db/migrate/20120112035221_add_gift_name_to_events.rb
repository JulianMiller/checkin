class AddGiftNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :gift_name, :string
  end
end
