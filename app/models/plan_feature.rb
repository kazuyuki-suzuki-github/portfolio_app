class PlanFeature < ApplicationRecord
    validates :plans_id, presence: true
    validates :features_id, presence: true
end
