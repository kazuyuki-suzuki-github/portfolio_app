class PlanFeature < ApplicationRecord
    validates :plans_id, presence: true
    validates :feature_id, presence: true
    belongs_to :feature
end
