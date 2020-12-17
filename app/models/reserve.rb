class Reserve < ApplicationRecord
  has_many :reserve_details, dependent: :destroy
  validates :user_id, presence: true
  validates :company_id, presence: true
  validates :plan_id, presence: true
end
