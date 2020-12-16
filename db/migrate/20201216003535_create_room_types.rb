class CreateRoomTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_types do |t|
      t.string :name
    end
  end
end
