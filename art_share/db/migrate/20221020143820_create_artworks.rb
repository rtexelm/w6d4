class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.bigint :artist_id, null: false
      t.index [:title, :artist_id], unique: true
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :artworks, :image_url, unique: true
    add_index :artworks, :artist_id
  end
end
