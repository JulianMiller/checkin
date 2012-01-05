class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.string :email

      t.timestamps
    end
  end
end
