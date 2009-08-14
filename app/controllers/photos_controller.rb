class PhotosController < ApplicationController
  before_filter :load_album, :only => [:index, :new, :create]
  def index
    @photos = @album.photos.all(:conditions => { :parent_id => nil })
  end
  
  def new
    @photo = Photo.new
    @photo.album = @album
  end
  
  def create
    @photo = Photo.new(params[:photo])
    @photo.album = @album
    
    if @photo.save
      flash[:notice] = "Photo was successfully saved!"
      redirect_to @photo
    else
      flash[:notice] = "File size must be 0-256 KB"
      render :action => :new
    end
  end
  
  def show
    @voteable = @photo = Photo.find(params[:id])
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo went missing in action!"
    redirect_to albums_url
  end

protected

  def load_album
    @album = Album.find(params[:album_id])
  end
end
