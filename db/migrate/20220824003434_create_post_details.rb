class CreatePostDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :post_details do |t|
      t.references :post, foreign_key: true
      t.integer :genre_id
      t.string  :custom_genre
      t.string  :title,       null: false
      t.integer :price,       null: false

      t.timestamps
    end
  end
end
