class CombineDateColumns < ActiveRecord::Migration
  def up
    remove_column :events, :date
    remove_column :events, :time
    remove_column :events, :timezone
    add_column    :events, :datetime, :datetime
  end

  def down
    add_column    :events, :date, :date
    add_column    :events, :time, :time
    add_column    :events, :timezone, :string
    remove_column :events, :datetime
  end
end
