class RemoveAlbumIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :album_id, :integer
  end
end
