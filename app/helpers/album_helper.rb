module AlbumHelper
    def photo_for(attachment)
        photo = Photo.find_by(image_id: attachment.id, album_id: attachment.record_id)
        return photo if !photo.nil?
        
        return Photo.new(description: "No description available for this photo", location:"Location not specified")
    end
    
    def image_for(ph)
        album = Album.find_by(id: ph.album_id)
        photo = album.images.find_by(id: ph.image_id)
        
        return photo
    end
end
