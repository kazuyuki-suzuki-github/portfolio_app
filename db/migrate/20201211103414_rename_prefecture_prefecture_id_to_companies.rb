class RenamePrefecturePrefectureIdToCompanies < ActiveRecord::Migration[6.0]
  def change
    rename_column :companies, :prefecture, :prefecture_id
  end
end
