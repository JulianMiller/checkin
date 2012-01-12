class AttendeesController < ApplicationController
  def new
  end

  def create
    @attendee = Attendee.new(params[:attendee])
    @event = Event.find(@attendee.event_id)
    GiftMailer.send_gift(@attendee.email, @event).deliver
    redirect_to root_path, notice: 'An email should be sent to you soon.'
  end
end
