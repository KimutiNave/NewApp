class FavoritesController < ApplicationController
  def create
    @another_post = AnotherPost.find(params[:another_post_id])
    current_user.favorite(@another_post)
    redirect_back fallback_location: another_posts_path, success: "お気に入りを解除しました"
  end

  def destroy
    @favorite = current_user.favorites.find(params[:another_post_id]).another_post
    current_user.unfavorite(@another_post)
    redirect_back fallback_location: another_posts_path, success: "お気に入りを解除しました"
  end
end
