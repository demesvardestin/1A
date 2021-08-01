class Album < ApplicationRecord
    has_many_attached :images
    has_many :photos
    belongs_to :admin
    
    def slug
        name.split(" ").join("-")
    end
end
