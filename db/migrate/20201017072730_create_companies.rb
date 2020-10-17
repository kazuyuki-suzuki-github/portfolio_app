class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.integer :company_id
      t.string :name
      t.string :address
      t.string :access
      t.text :info

      t.timestamps
      
      
    end
  end
end
