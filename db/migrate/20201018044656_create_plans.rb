class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.integer :company_id
      t.string :name
      t.time :check_in
      t.time :check_out
      t.integer :stock
      t.integer :price
      t.date :sale_from
      t.date :sale_to
      t.integer :room_type

      t.timestamps
    end
  end
end
