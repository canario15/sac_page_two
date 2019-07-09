class CreateRaceResults < ActiveRecord::Migration[5.2]
  def change
    create_table :race_results do |t|
      t.integer :score
      t.integer :position
      t.integer :score_for_champ
      t.references :pilot_race, foreign_key: true
      t.references :race, foreign_key: true
      t.references :pilot, foreign_key: true

      t.timestamps
    end
  end
end
