class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @another_post = AnotherPost.find(params[:another_post_id])
    current_user.favorite(@another_post)
  end

  def destroy
    @another_post = current_user.favorites.find(params[:id]).another_post
    current_user.unfavorite(@another_post)
  end
end
