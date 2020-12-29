class Search include ActiveModel::Model
  attr_accessor :prefecture_id, :checkin, :checkout, :people
  validates :prefecture_id, presence: true
  validates :checkin, presence: true
	validates :checkout, presence: true
	validates :people, presence: true

	validate :validateCheckoutAfterCheckin
	validate :validateDayAfterToday

  def validateCheckoutAfterCheckin
		if checkin.present? && checkout.present?
    	errors.add(:checkout, :validateCheckoutAfterCheckinMessage) if checkin > checkout
		end
	end
		
	def validateDayAfterToday
		if checkin.present?
			errors.add(:checkin, :validateDayAfterTodayMessage) if Time.parse(checkin) < Date.today
		end
		if checkout.present?
			errors.add(:checkout, :validateDayAfterTodayMessage) if Time.parse(checkout) < Date.today
		end
	end
end
