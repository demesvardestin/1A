class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :album_id
      t.integer :image_id
      t.text :description, default: "No description provided for this photo"
      t.string :location, default: "Location not specified"
      t.string :tags, default: ""

      t.timestamps
    end
  end
end
