class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :file_type).order(created_at: :desc).page(params[:page])
  end

  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "メモが作成されました"
    else
      flash.now[:warning]= "メモの作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to request.referer, notice: 'メモが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
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

  private

  def post_params
    params.require(:post).permit(:save_type_name, :title, :file_type_id, :other_file_name, :code_content, :other_content)
  end
end
