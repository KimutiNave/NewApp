class ArticlesController < ApplicationController
  def index
    @posts = Post.all(created_at: :desc)
    @another_posts = Another_post.all(created_at: :desc)
  end
end
