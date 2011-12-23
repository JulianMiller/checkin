class EventsController < ApplicationController
  def index
    @events = current_user.events
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(params[:event])

    if @event.save
      redirect_to events_path, notice: 'Event was created successfully'
    else
      render action: 'new'
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    
    if @event.update_attributes(params[:event])
      redirect_to events_url, notice: 'Event was updated successfully'
    else
      render action: 'new'
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to events_url
  end
end
