class Album < ApplicationRecord
    has_many_attached :images
    
    def slug
        name.split(" ").join("-")
    end
end
