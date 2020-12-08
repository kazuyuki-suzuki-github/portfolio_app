class ChangeOptionCoinToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :coin, :integer, default:100
  end
end
