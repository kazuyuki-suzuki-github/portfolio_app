class RemoveReservesIdFromReserveDetails < ActiveRecord::Migration[6.0]
  def change
    remove_column :reserve_details, :reserves_id, :bigint
  end
end
