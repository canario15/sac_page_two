class AddFullNameToPilot < ActiveRecord::Migration[5.2]
  def change
    add_column :pilots, :full_name, :string
  end
end
