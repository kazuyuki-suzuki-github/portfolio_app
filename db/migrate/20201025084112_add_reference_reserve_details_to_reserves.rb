class AddReferenceReserveDetailsToReserves < ActiveRecord::Migration[6.0]
  def change
    add_reference :reserve_details, :reserves, foreign_key: true
  end
end
