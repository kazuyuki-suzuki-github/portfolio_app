class EmailColumnToBinary < ActiveRecord::Migration[6.0]
  def change
    execute('ALTER TABLE users MODIFY email varchar(255) BINARY')
  end
end
