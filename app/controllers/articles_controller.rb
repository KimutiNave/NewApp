class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @posts = current_user.posts.all.order(created_at: :desc).page(params[:page]) || []
    @another_posts = current_user.another_posts.all.order(created_at: :desc).page(params[:page]) || []
    @articles = @posts + @another_posts
    @paginated_articles = Kaminari.paginate_array(@articles, total_count: @articles.count).page(params[:page])
  end
end
