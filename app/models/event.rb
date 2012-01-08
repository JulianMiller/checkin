class Event < ActiveRecord::Base
  belongs_to :user

  before_save :to_utc, :create_end_datetime, :add_bounds_to_locations

  def to_utc
    # Set the timezone
    Time.zone = timezone

    # Get the offset in hours
    offset = Time.zone.utc_offset/60/60

    # Invert the sign of the offset to we can get it back to UTC
    offset *= -1

    # Store the time in UTC
    self.datetime += offset.hours
  end

  def create_end_datetime
    self.end_datetime = datetime + 2.hours
  end
  
  def add_bounds_to_locations
    self.min_latitude  = latitude - 0.001
    self.max_latitude  = latitude + 0.001
    self.min_longitude = longitude - 0.001
    self.max_longitude = longitude + 0.001
  end

  def self.find_by_time_and_location(time, params)
    event = Event.where(["longitude = ? AND latitude = ? AND end_datetime > ? AND datetime < ?", params[:longitude], params[:latitude], time, time])
  end
end
