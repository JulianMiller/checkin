class Event < ActiveRecord::Base
  belongs_to :user

  before_save :to_utc, :create_end_datetime

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

  def self.find_by_time_and_location(time, params)
    logger.debug time
    logger.debug params
  end
end
