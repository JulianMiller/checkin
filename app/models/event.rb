class Event < ActiveRecord::Base
  belongs_to :user

  before_save :to_utc

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
end
