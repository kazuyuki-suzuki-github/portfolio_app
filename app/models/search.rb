class Search include ActiveModel::Model
  attr_accessor :prefecture_id, :checkin, :checkout, :people
  validates :prefecture_id, presence: true
  validates :checkin, presence: true
	validates :checkout, presence: true
	validates :people, presence: true

	validate :validateCheckoutAfterCheckin
	validate :validateDayAfterToday
	
  def validateCheckoutAfterCheckin
    errors.add(:checkout, "チェックアウト日はチェックイン日より後の日付にしてください") if checkin > checkout
	end
		
	def validateDayAfterToday
		errors.add(:checkin, "本日以降の日付を入力してください") if Time.parse(checkin) < Date.today
		errors.add(:checkout, "本日以降の日付を入力してください") if Time.parse(checkout) < Date.today
	end
end
