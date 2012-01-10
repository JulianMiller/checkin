class AttendeesController < ApplicationController
  def new
  end

  def create
    GiftMailer.send_gift(params[:email]).deliver
    redirect_to root_path, notice: 'An email should be sent to you soon.'
  end
end
