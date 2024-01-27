class AnotherPostsController < ApplicationController
  def new
    @another_post = AnotherPost.new
  end

  def create
    @another_post = AnotherPost.new(another_post_params)
    if @another_post.save
      redirect_to articles_path, success: 'メモが作成されました'
    else
      flash.now['danger'] = 'メモの作成に失敗しました'
      render :new
    end
  end

  private

  def another_post_params
    params.require(:another_post).permit(:error_type_name, :status_error_name, :other_error_name, :title, :file_name, :other_file_name, :code_content, :other_content)
  end
end
