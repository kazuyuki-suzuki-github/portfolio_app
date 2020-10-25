class AddReferenceReserveDetailsToReservesTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :reserve_details, :reserve, foreign_key: true
  end
end
