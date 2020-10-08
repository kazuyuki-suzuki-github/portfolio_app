class User < ApplicationRecord
  has_secure_password
  validates :name,  presence: true, length: { maximum:15}
  validates :email, presence: true, length: { maximum:255}, uniqueness: true
end
