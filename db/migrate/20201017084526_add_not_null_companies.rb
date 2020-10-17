class AddNotNullCompanies < ActiveRecord::Migration[6.0]
  def change
    change_column_null :companies, :company_id, false
    change_column_null :companies, :name, false
    change_column_null :companies, :address, false
  end
end
