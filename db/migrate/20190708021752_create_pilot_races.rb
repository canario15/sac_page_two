class CreatePilotRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :pilot_races do |t|
      t.integer :pilot_id
      t.integer :race_id
      t.integer :number
      t.timestamps
    end
  end
end
