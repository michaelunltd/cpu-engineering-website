class Event < ActiveRecord::Base
	acts_as :article

  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date < DateTime.now()
      errors.add(:start_date, "can't be in the past")
    end
  end

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
