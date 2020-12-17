class ReserveDetail < ApplicationRecord
    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :people, presence: true
    validates :reserve_id, presence: true
end
