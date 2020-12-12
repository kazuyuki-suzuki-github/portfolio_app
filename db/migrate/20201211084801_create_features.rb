class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.integer :genre
      t.string :name

      t.timestamps
    end
  end
end
