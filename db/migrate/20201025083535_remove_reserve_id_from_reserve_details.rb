class RemoveReserveIdFromReserveDetails < ActiveRecord::Migration[6.0]
  def change
    remove_column :reserve_details, :reserve_id, :integer
  end
end
