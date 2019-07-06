class CreateJoinTableCategoryPilot < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :pilots do |t|
      t.index [:category_id, :pilot_id]
      t.index [:pilot_id, :category_id]
    end
  end
end
