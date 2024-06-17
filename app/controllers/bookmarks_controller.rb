class BookmarksController < ApplicationController
  def create
    binding.pry
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_back fallback_location: posts_path, success: "お気に入りにしました"
  end

  def destroy
    post = current_user.bookmarks.find(params[:id]).post
    current_user.unbookmark(post)
    redirect_back fallback_location: posts_path, success: "お気に入りを解除しました"
  end
end
