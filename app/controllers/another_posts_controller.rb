class AnotherPostsController < ApplicationController
  def index
    @q = current_user.another_posts.ransack(params[:q])
    @another_posts = @q.result(distinct: true).includes(:user, :file_type).order(created_at: :desc).page(params[:page])
  end
  
  def new
    @another_post = current_user.another_posts.build
  end

  def create
    @another_post = current_user.another_posts.build(another_post_params)
    if @another_post.save
      redirect_to another_posts_path, notice: "メモが作成されました"
    else
      flash.now[:notice] = 'メモの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @another_post = current_user.another_posts.find(params[:id])
  end

  def update
    @another_post = current_user.another_posts.find(params[:id])
    if @another_post.update(another_post_params)
      redirect_to request.referer, notice: 'メモが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @another_post = current_user.another_posts.find(params[:id])
    @another_post.destroy
    redirect_to another_posts_path, notice: 'メモが削除されました'
  end

  def search
    @another_posts = AnotherPost.includes(:user, :file_type).joins(:file_type).where("CAST(status_error_name AS text) LIKE ? OR CAST(other_error_name AS text) LIKE ? OR CAST(title AS text) LIKE ?  OR CAST(other_file_name AS text) LIKE ? OR CAST(file_types.file_name AS text) LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    .distinct
    respond_to do |format|
      format.js
    end
  end

  private

  def another_post_params
    params.require(:another_post).permit(:error_type_name, :status_error_name, :other_error_name, :title, :file_type_id, :other_file_name, :code_content, :other_content)
  end
end
