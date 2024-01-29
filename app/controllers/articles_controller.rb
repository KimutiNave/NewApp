class ArticlesController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]) || []
    @another_posts = AnotherPost.all.order(created_at: :desc).page(params[:page]) || []
    @articles = @posts + @another_posts
    @paginated_articles = Kaminari.paginate_array(@articles).page(params[:page])
  end
end
