module AlbumHelper
    def photo_for(attachment)
        photo = Photo.find_by(image_id: attachment.id, album_id: attachment.record_id)
        return photo if !photo.nil?
        
        return Photo.new(description: "No description available for this photo", location:"Location not specified")
    end
end
