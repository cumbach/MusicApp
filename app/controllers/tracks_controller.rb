class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render :index
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      render json: @track.track_name
      # redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end



  private
  def track_params
    params.require(:track).permit(:track_name, :album_id, :lyrics)
  end

end
