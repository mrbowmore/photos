class PhotosController < ApplicationController
  
  def index
    @photos = Photo.all(:conditions => { :parent_id => nil })
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    album = Album.find(params[:album_id])
    @photo = Photo.new(params[:photo])
    @photo.album = album
    
    if @photo.save
      flash[:notice] = "Photo was successfully saved!"
      redirect_to @photo
    else
      flash[:notice] = "File size must be between 0->1024 KB"
      render :action => :new
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo went missing in action!"
    redirect_to albums_url
  end

end
