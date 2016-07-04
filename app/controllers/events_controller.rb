class EventsController < ApplicationController
	load_and_authorize_resource
	before_action :find_event, only: [:show, :edit, :destroy, :update]

	def index
		@events = Event.all
		@timeNow = DateTime.now


		puts "==========================="
		puts @timeNow
		puts "==========================="
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		event_params[:start_date] = Time.parse(event_params[:start_date])
		event_params[:end_date] = Time.parse(event_params[:end_date])
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
		event_params[:start_date] = Time.parse(event_params[:start_date])
		event_params[:end_date] = Time.parse(event_params[:end_date])
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
		params.require(:event).permit(:title, :content, :image, :venue, :start_date, :end_date)
	end

	def find_event
		@event = Event.find params[:id]
	end

end
