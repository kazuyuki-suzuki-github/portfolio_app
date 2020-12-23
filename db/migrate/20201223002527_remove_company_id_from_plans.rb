class RemoveCompanyIdFromPlans < ActiveRecord::Migration[6.0]
  def change
    remove_column :plans, :company_id, :int
  end
end
