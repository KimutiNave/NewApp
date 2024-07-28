class PostsController < ApplicationController
  def index
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :file_type, :bookmarks).order(created_at: :desc).page(params[:page])
  end

  def new
    @post_form = PostForm.new
  end
  
  def create
    binding.pry
    @post_form = PostForm.new(post_params)
    if @post_form.save
      @post = Post.find(params[:id])
      @post.create_notification_setting!(current_user)
      redirect_to posts_path, notice: "メモが作成されました"
    else
      flash.now[:warning]= "メモの作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @post_form = PostForm.new(post: @post)
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post_form = PostForm.new(post_params, post: @post)
    @post_form.update_post
    redirect_to @post
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "メモが削除されました" 
  end

  def search
    @posts = current_user.posts.includes(:user, :file_type)
    .joins(:file_type)
    .where("CAST(title AS text) LIKE ? OR CAST(other_file_name AS text) LIKE ? OR CAST(file_types.file_name AS text) LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    .distinct
    respond_to do |format|
      format.js
    end
  end

  def bookmarks
    @q = current_user.bookmark_posts.ransack(params[:q])
    @bookmark_posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
    #@bookmark_posts = current_user.bookmark_posts.distinct.includes(:user).order(created_at: :desc)
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post_form).permit(:save_type_name, :title, :file_type_id, :other_file_name, :code_content, :other_content, :notify_days).merge(user_id: current_user.id)
  end
end
