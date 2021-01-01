class RemoveFeaturesIdFrom < ActiveRecord::Migration[6.0]
  def change
    remove_reference :plan_features, :features, index: true
  end
end
