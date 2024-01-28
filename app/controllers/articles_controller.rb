class ArticlesController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
    @another_posts = Another_post.all.order(created_at: :desc).page(params[:page])
    @articles = @posts + @aposts
    @paginated_articles = @articles.page(params[:page])
  end
end
