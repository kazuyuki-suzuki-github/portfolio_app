class AddColumnToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :prefecture, :integer, null: false
  end
end
