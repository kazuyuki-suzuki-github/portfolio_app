class Reserve < ApplicationRecord
  has_many :reserve_details, dependent: :destroy
end
