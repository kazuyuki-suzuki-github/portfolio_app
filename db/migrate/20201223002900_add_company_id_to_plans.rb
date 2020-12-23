class AddCompanyIdToPlans < ActiveRecord::Migration[6.0]
  def change
    add_reference :plans, :company, null: false, foreign_key: true
  end
end
