class AttendeesController < ApplicationController
  def new
  end

  def create
    @attendee = Attendee.new(params[:attendee])
    GiftMailer.send_gift(@attendee.email).deliver
    redirect_to root_path, notice: 'An email should be sent to you soon.'
  end
end
