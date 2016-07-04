class Event < ActiveRecord::Base
	acts_as :article

  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date < Time.now
      errors.add(:start_date, "can't be in the past")
    end
  end

	def upcoming?
		startTime = Time.parse(start_date.to_s)
		now = Time.now

		return now < startTime
	end

	def ongoing?
		startTime = Time.parse(start_date.to_s)
		endTime = Time.parse(end_date.to_s)
		now = Time.now

		return startTime < now && now < endTime
	end


	def ended?
		endTime = Time.parse(end_date.to_s)
		now = Time.now

		return now > endTime
	end

	def status
		if upcoming?
			return "Upcoming"
		elsif ongoing?
			return "Ongoing"
		elsif ended?
			return "Done"
		end
	end


	def start_time
		self.start_date
	end


end
