class AddAdminIdToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :admin_id, :integer
  end
end
