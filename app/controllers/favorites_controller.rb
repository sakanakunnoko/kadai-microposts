class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  #def index
    #if logged_in?
      #@favorites = current_user.like.order(id: :desc).page(params[:page])
    #end
  #end
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.fav(micropost)
    flash[:success] = '投稿をお気に入りに登録しました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfav(micropost)
    flash[:success] = '投稿をお気に入りから削除しました。'
    redirect_to root_url
  end
end
