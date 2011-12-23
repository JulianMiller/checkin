class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :timezone
      t.float :latitude
      t.float :longitude
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
