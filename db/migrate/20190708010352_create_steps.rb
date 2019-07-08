class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :race, foreign_key: true
      t.integer :number
      t.string :name
      t.text :observation

      t.timestamps
    end
  end
end
