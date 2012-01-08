class AddEndDatetimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end_datetime, :datetime
  end
end
