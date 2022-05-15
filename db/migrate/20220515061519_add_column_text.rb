class AddColumnText < ActiveRecord::Migration[6.1]
  def change
    def up
      add_column :text, :place, :string
    end
  end
end
