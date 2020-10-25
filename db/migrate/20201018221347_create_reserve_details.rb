class CreateReserveDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :reserve_details do |t|
      t.integer :reserve_id
      t.date :check_in
      t.date :check_out
      t.integer :people

      t.timestamps
    end
  end
end
