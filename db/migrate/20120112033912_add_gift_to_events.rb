class AddGiftToEvents < ActiveRecord::Migration
  def change
    add_column :events, :gift, :string
  end
end
