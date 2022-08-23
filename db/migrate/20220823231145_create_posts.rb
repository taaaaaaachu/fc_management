class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :user_id, null: false
      t.boolean :is_public, null: false, default: "TRUE"
      
      t.timestamps
    end
  end
end
