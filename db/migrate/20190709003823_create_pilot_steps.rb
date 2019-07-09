class CreatePilotSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :pilot_steps do |t|
      t.integer :score
      t.integer :position
      t.string :time
      t.references :step, foreign_key: true
      t.references :pilot_race, foreign_key: true

      t.timestamps
    end
  end
end
