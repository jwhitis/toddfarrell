class Admin::PlayerTracksController < Admin::AdminController
  respond_to :js

  def index
    @player_track = PlayerTrack.new
    @player_tracks = PlayerTrack.display_order
  end

  def create
    @player_track = PlayerTrack.new(player_track_params)

    if @player_track.save
      @player_track = PlayerTrack.new
      flash.now[:notice] = "Track successfully added."
    end

    @player_tracks = PlayerTrack.display_order
    render :index
  end

  def destroy
    @player_track = PlayerTrack.find(params[:id])
    @player_track.destroy
    @player_track = PlayerTrack.new
    @player_tracks = PlayerTrack.display_order
    flash.now[:notice] = "Track successfully removed."
    render :index
  end

  private

  def player_track_params
    params.require(:player_track).permit(:title, :audio, :audio_cache)
  end

end