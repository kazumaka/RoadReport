class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id
      t.string :post_name
      t.text :introduction
      t.string :road_name
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
