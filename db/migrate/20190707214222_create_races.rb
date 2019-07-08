class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.references :championship, foreign_key: true
      t.string :city
      t.string :name
      t.datetime :date
      t.text :observation
      t.boolean :done
      t.references :circuit, foreign_key: true

      t.timestamps
    end
  end
end
