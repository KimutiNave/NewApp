class ArticlesController < ApplicationController
  def index
    @posts = Post.all
    @another_posts = Another_post.all
  end
end
