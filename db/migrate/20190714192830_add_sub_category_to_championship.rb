class AddSubCategoryToChampionship < ActiveRecord::Migration[5.2]
  def change
    add_reference :championships, :sub_category, foreign_key: true
  end
end
