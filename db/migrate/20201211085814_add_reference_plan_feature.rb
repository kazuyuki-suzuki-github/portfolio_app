class AddReferencePlanFeature < ActiveRecord::Migration[6.0]
  def change
    add_reference :plan_features, :plans, foreign_key: true
    add_reference :plan_features, :features, foreign_key: true
  end
end
