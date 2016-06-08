class Event < ActiveRecord::Base
	acts_as :article

	def isUpcoming?
		@startTime = DateTime.parse(start_date.to_s)
		@now = DateTime.now

		return @now < @startTime
	end

	def isOngoing?
		@startTime = DateTime.parse(start_date.to_s)
		@endTime = DateTime.parse(end_date.to_s)
		@now = DateTime.now

		return @startTime < @now && @now < @startTime
	end

	def hasEnded?
		@endTime = DateTime.parse(end_date.to_s)
		@now = DateTime.now

		return @now > @endTime
	end


end
