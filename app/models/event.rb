class Event < ActiveRecord::Base
	acts_as :article

  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date < DateTime.now()
      errors.add(:start_date, "can't be in the past")
    end
  end

	def isUpcoming?
		# @startTime = Time.zone.parse(start_date.to_s)
		@startTime = start_date
		@now = DateTime.now()
		puts "=================================="
		puts @now < @startTime
		puts @now < @startTime
		puts title
		puts "=================================="
		return @now < @startTime
	end

	def isOngoing?
		# @startTime = DateTime.parse(start_date.to_s)
		# @endTime = DateTime.parse(end_date.to_s)
		@now = DateTime.now
		@startTime = start_date
		@endTime = end_date

		return @startTime < @now && @now < @endTime
	end

	def hasEnded?
		# @endTime = DateTime.parse(end_date.to_s)
		@endTime = end_date
		@now = DateTime.now

		return @now > @endTime
	end

	def status
		if self.isUpcoming?
			return "Upcoming"
		elsif self.isOngoing?
			return "Ongoing"
		elsif self.hasEnded?
			return "Done"
		end
	end

	def start_time
		self.start_date
	end


end
