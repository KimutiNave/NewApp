class AnotherPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = current_user.another_posts.ransack(params[:q])
    @another_posts = @q.result(distinct: true).includes(:user, :file_type).order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.json {render json: @another_posts}
      format.js
    end
  end
  
  def new
    @another_post = current_user.another_posts.build
  end

  def create
    @another_post = current_user.another_posts.build(another_post_params)
    respond_to do |format|
      if @another_post.save
        format.html {redirect_to another_posts_path(@another_post), notice: "メモが作成されました"}
        format.json { render :index, status: :created, location: @another_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @another_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @another_post = current_user.another_posts.find(params[:id])
  end

  def update
    @another_post = current_user.another_posts.find(params[:id])

    respond_to do |format|
      if @another_post.update(another_post_params)
        format.html {redirect_to request.referer, notice: 'メモが更新されました'}
        format.json { render json: @another_post } 
      else
        format.html {render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @another_post = current_user.another_posts.find(params[:id])
    @another_post.destroy
    respond_to do |format|
      format.html {redirect_to another_posts_path, notice: 'メモが削除されました',  status: :see_other }
    end
  end

  def search
    @another_posts = current_user.another_posts.includes(:user, :file_type).joins(:file_type).where("status_error_name LIKE ? OR other_error_name LIKE ? OR title LIKE ?  OR other_file_name LIKE ? OR file_types.file_name LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    .distinct
    respond_to do |format|
      format.html
      format.json { render json: @another_posts }
      format.js
    end
  end

  private

  def another_post_params
    params.require(:another_post).permit(:error_type_name, :status_error_name, :other_error_name, :title, :file_type_id, :other_file_name, :code_content, :other_content)
  end
end
