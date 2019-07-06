class CreateChampionships < ActiveRecord::Migration[5.2]
  def change
    create_table :championships do |t|
      t.string :name
      t.integer :year
      t.integer :one_id
      t.integer :two_id
      t.integer :three_id
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
