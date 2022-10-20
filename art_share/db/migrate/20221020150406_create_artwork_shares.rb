class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.bigint :artwork_id, null: false
      t.bigint :viewer_id, null: false
      t.index [:artwork_id, :viewer_id], unique: true
      t.timestamps
    end

    remove_index :artworks, :artist_id
    add_foreign_key :artwork_shares, :artworks, column: :artwork_id, primary_key: :id
    add_foreign_key :artwork_shares, :users, column: :viewer_id, primary_key: :id

  end
end
