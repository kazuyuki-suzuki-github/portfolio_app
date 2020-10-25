class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
