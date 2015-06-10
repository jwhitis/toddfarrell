class Admin::AlbumsController < Admin::AdminController
  before_action :find_album, only: [:edit, :update, :destroy]
  respond_to :js

  def index
    @albums = Album.display_order.page(params[:page])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      @albums = Album.display_order.page(params[:page])
      flash.now[:notice] = "Album successfully created."
      render :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update_attributes(album_params)
      @albums = Album.display_order.page(params[:page])
      flash.now[:notice] = "Album successfully updated."
      render :index
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    @albums = Album.display_order.page(params[:page])
    flash.now[:notice] = "Album successfully deleted."
    render :index
  end

  private

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :release_date, :notes, :bandcamp_url, :itunes_url,
      :cover_art, :published)
  end

end