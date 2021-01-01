class AddColumnFeatureIdToPlanFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :plan_features, :feature_id, :bigint
  end
end
