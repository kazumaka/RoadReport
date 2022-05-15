class AddTextsToLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :logs, :text, :string
  end
end
