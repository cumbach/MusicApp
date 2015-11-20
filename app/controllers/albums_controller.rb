class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    # debugger
    if @album.save
      render json: @album.album_name
      # redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end



  private
  def album_params
    params.require(:album).permit(:album_name, :band_id, :album_type)
  end

end
