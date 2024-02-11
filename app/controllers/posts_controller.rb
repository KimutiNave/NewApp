class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = current_user.posts.build
  end
  
  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to articles_path, success: 'メモが作成されました'
    else
      flash.now[:alert] = 'メモの作成に失敗しました'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:save_type_name, :title, :file_name, :other_file_name, :code_content, :other_content)
  end
end
