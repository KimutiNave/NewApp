class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :file_type).order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.json {render json: @posts}
      format.js
    end
  end

  def new
    @post = current_user.posts.build
  end
  
  def create 
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path(@post), notice: "メモが作成されました" }
        format.json { render :index, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit 
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to request.referer, notice: 'メモが更新されました'}
        format.json { render json: @post } 
      else
        format.html {render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "メモが削除されました", status: :see_other }
    end
  end

  def search
    @posts = current_user.posts.includes(:user, :file_type)
    .joins(:file_type)
    .where("title LIKE ? OR other_file_name LIKE ? OR file_types.file_name LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    .distinct
    respond_to do |format|
      format.html # HTML形式のリクエストに対応
      format.json { render json: @posts } # JSON形式のリクエストに対応。オートコンプリート用のデータをJSONで返す
      format.js 
    end
  end

  private

  def post_params
    params.require(:post).permit(:save_type_name, :title, :file_type_id, :other_file_name, :code_content, :other_content)
  end
end
