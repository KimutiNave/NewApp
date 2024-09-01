class AnotherPostsController < ApplicationController
  def index
    @q = current_user.another_posts.ransack(params[:q])
    @another_posts = @q.result(distinct: true).includes(:user, :file_type, :favorites).order(created_at: :desc).page(params[:page])
  end
  
  def new
    #binding.pry
    @another_post_form = AnotherPostForm.new
  end

  def create
    @another_post_form = AnotherPostForm.new(another_post_params)
    binding.pry
    if @another_post_form.valid?
      @another_post_form.save
      redirect_to another_posts_path, notice: "メモが作成されました"
    else
      flash.now[:notice] = 'メモの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    #binding.pry
    @another_post = current_user.another_posts.find(params[:id])
    @another_post_form = AnotherPostForm.new(another_post: @another_post)
  end

  def update
    @another_post = current_user.another_posts.find(params[:id])
    @another_post_form = AnotherPostForm.new(another_post_params, another_post: @another_post)
    @another_post_form.update_another_post
    redirect_to @another_post
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

  def favorites
    @q = current_user.favorite_another_posts.ransack(params[:q])
    @favorite_another_posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @another_post = current_user.another_posts.find(params[:id])
  end
  
  private

  def another_post_params
    params.require(:another_post_form).permit(:error_type_name, :status_error_name, :other_error_name, :title, :file_type_id, :other_file_name, :code_content, :other_content, :confirmn, :notice_days).merge(user_id: current_user.id)
  end
end
