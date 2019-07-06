class CreateCircuits < ActiveRecord::Migration[5.2]
  def change
    create_table :circuits do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :large
      t.string :map_position
      t.string :video_url

      t.timestamps
    end
  end
end
