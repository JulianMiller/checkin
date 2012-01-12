class Event < ActiveRecord::Base
  belongs_to :user

  mount_uploader :gift, GiftUploader

  before_save :to_utc, :create_end_datetime, :add_bounds_to_locations, :save_original_file_name
  
  validates :name, :presence => true
  validates :venue, :presence => true
  validates :address, :presence => true
  validates :latitude,  :presence => true
  validates :longitude, :presence => true

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

  def original_file_name
    self.gift_name = self.file.original_name
  end

  def self.find_by_time_and_location(time, params)
    self.where(["min_longitude <= ? AND max_longitude >= ? AND min_latitude <= ? AND max_latitude >= ? AND end_datetime > ? AND datetime < ?", params[:longitude], params[:longitude], params[:latitude], params[:latitude], time, time]).first
  end

  def self.find_by_time(time)
    self.where(["end_datetime > ? AND datetime < ?", time, time]).first
  end

  def self.find_by_location(params)
    self.where(["min_longitude <= ? AND max_longitude >= ? AND min_latitude <= ? AND max_latitude >= ?", params[:longitude], params[:longitude], params[:latitude], params[:latitude]]).first
  end
end
