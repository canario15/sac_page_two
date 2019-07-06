class CreatePilots < ActiveRecord::Migration[5.2]
  def change
    create_table :pilots do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :city
      t.string :team
      t.string :car
      t.boolean :active

      t.timestamps
    end
  end
end
