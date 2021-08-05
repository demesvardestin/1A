class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update]
  before_action :authenticate_admin!, except: [:show, :index]
  
  def index
    @albums = Album.all
  end
  
  def new
    @album = Album.new
  end
  
  def create
    @album = Album.create(album_params)
    @album.admin = current_admin
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: "Album created!" }
          
        @album.images.each do |i|
          Photo.find_or_create_by(album_id: i.record_id, image_id: i.id)
        end
      else
        p flash[:notice]
        format.html { render :new, notice: flash[:notice] }
      end
    end
  end
  
  def update
    @album.update(album_params)
    
    respond_to do |format|
      if @album.save
        format.html { redirect_to "/photography/#{@album.id}/#{@album.slug}", notice: "Album updated!" }
          
        @album.images.each do |i|
          Photo.find_or_create_by(album_id: i.record_id, image_id: i.id)
        end
      else
        format.html { redirect_to :back, notice: "An error occurred" }
      end
    end
  end
  
  private
  
  def set_album
    @album = Album.find(params[:id])
  end
  
  def album_params
    params.require(:album)
    .permit(
      :name,
      :description,
      images: []
      )
  end
end
