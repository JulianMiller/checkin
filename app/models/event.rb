class Event < ActiveRecord::Base
  belongs_to :user

  attr_accessor :timezone

  before_save :add_timezone

  def add_timezone
    Time.zone = timezone
    tz = Time.zone.utc_offset/60/60
    datetime.change(:offset => tz.to_s)
  end
end
