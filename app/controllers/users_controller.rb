class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:name_confirm, :name_check]

  def check
    @user = User.find(current_user.id)
  end

  def withdrawal
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_user_session_path
  end
end
