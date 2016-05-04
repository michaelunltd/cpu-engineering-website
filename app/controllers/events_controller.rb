class EventsController < ApplicationController
	load_and_authorize_resource
	before_action :find_event, only: [:show, :edit, :destroy, :update]

	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		event_params[:startDate] = DateTime.parse(event_params[:startDate])
		event_params[:endDate] = DateTime.parse(event_params[:endDate])
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_path
		else
			flash[:notice] = 'Event WAS NOT added.'
			render :new
		end
	end

	def edit
	end

	def update
		event_params[:startDate] = DateTime.parse(event_params[:startDate])
		event_params[:endDate] = DateTime.parse(event_params[:endDate])
		if @event.update(event_params)
			redirect_to events_path
		else
			flash[:notice] = 'Event WAS NOT updated.'
			render :edit
		end
	end

	def destroy
		@event.destroy
		redirect_to events_path
	end

private

	def event_params
		params.require(:event).permit(:title, :description, :image, :venue, :startDate, :endDate)
    # params.require(:news).permit(:title, :content, :image, :author)
	end

	def find_event
		@event = Event.find params[:id]
	end

end
