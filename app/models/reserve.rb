class Reserve < ApplicationRecord
  has_many :reserve_details, dependent: :destroy
  belongs_to :plan
  belongs_to :company
  validates :user_id, presence: true
  validates :company_id, presence: true
  validates :plan_id, presence: true
end
