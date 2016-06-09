class Event < ActiveRecord::Base
	acts_as :article

  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date < DateTime.now()
      errors.add(:start_date, "can't be in the past")
    end
  end


end
