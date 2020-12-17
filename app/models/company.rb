class Company < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    has_many_attached :portraits
    validates :company_id, presence: true
    validates :name, presence: true, length: {maximum: 255}
    validates :address, presence: true, length: {maximum: 255}
    validates :access, presence: true, length: {maximum: 255}
    validates :info, presence: true
    validates :prefecture_id, presence: true
end
