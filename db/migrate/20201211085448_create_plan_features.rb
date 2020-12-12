class CreatePlanFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_features do |t|

      t.timestamps
    end
  end
end
