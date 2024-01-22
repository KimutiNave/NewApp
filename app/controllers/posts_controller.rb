class PostsController < ApplicationController
  def index 
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
  
  def create 
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, success: 'メモが作成されました'
    else
      flash.now['danger'] = 'メモの作成に失敗しました'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:save_type_name, :title, :file_name, :code_content, :other_content)
  end
end
