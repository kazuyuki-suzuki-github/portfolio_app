class Plan < ApplicationRecord
    has_many_attached :portraits
    validates :name, presence: true, length: {maximum: 255}
    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :stock, presence: true
    validates :price, presence: true
    validates :sale_from, presence: true
    validates :sale_to, presence: true
    validates :room_type, presence: true
    belongs_to :company
end
