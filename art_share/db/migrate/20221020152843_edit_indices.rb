class EditIndices < ActiveRecord::Migration[7.0]
  def change
      add_index :artwork_shares, :viewer_id, unique: true
      remove_index :artworks, [:title, :artist_id]
      add_index :artworks, [:artist_id, :title], unique:true
  end
end
