class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.boolean :is_public, null: false, default: "TRUE"
      
      t.timestamps
    end
  end
end
