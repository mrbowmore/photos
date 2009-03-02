class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
    @photo = Photo.new
  end

  def create
    @album = Album.new(params[:album].merge(:user => current_user))
  
    if @album.save
      flash[:notice] = "Album was successfully created!"
      redirect_to albums_url
    else
      render :action => "new"
    end
  end
  
  def update
    @album = Album.find(params[:id])
    
    if @album.update_attributes(params[:album])
      flash[:notice] = "Album was successfully updated!"
      redirect_to albums_url
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    
    redirect_to albums_url
  end
  
end
