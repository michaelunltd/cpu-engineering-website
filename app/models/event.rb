class Event < ActiveRecord::Base
	acts_as :article

  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date < Time.now()
      errors.add(:start_date, "can't be in the past")
    end
  end

	def isUpcoming?
		@startTime = Time.parse(start_date.to_s)
		@now = Time.now

		return @now < @startTime
	end

	def isOngoing?
		@startTime = Time.parse(start_date.to_s)
		@endTime = Time.parse(end_date.to_s)
		@now = Time.now

		return @startTime < @now && @now < @endTime
	end

	def hasEnded?
		@endTime = Time.parse(end_date.to_s)
		@now = Time.now

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

end
