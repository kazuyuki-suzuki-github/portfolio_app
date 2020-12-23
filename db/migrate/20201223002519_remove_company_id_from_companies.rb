class RemoveCompanyIdFromCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :company_id, :int
  end
end
