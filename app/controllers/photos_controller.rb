class PhotosController < ApplicationController
    # before_action :authenticate_admin!
    before_action :set_photo
    
    def edit
        @album = @photo.album
        @attachment = @album.images.find @photo.image_id
    end
    
    def update
        @photo.update(photos_params)
        
        respond_to do |format|
            if @photo.save
                format.html { redirect_to @photo.album, notice: "Photo #{@photo.id} updated!" }
            else
                format.html { redirect_to :back, notice: "Failed to update photo" }
            end
        end
    end
    
    private
    
    def set_photo
        @photo = Photo.find(params[:id])
    end
    
    def photos_params
        params
        .require(:photo)
        .permit(
            :location,
            :description,
            :tags
            )
    end
end