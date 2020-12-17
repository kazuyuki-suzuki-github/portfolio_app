class PlanFeature < ApplicationRecord
    attr_accessor :plans_id, :features_id
    validates :plans_id, presence: true
    validates :features_id, presence: true
end
