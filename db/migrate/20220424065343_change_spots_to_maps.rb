class ChangeSpotsToMaps < ActiveRecord::Migration[6.1]
  def change
    rename_table :spots, :maps
  end
end
