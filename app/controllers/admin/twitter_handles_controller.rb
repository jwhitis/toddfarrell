class Admin::TwitterHandlesController < Admin::AdminController
  respond_to :js

  def index
    @twitter_handles = TwitterHandle.display_order.page(params[:page])
    @twitter_handle = TwitterHandle.new
  end

  def create
    @twitter_handle = TwitterHandle.new(twitter_handle_params)

    if @twitter_handle.save
      @twitter_handle = TwitterHandle.new
      flash.now[:notice] = "Username successfully added."
    end

    @twitter_handles = TwitterHandle.display_order.page(params[:page])
    render :index
  end

  def destroy
    @twitter_handle = TwitterHandle.find(params[:id])
    @twitter_handle.destroy
    @twitter_handle = TwitterHandle.new
    @twitter_handles = TwitterHandle.display_order.page(params[:page])
    flash.now[:notice] = "Username successfully removed."
    render :index
  end

  private

  def twitter_handle_params
    params.require(:twitter_handle).permit(:handle)
  end

end