class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:name_confirm]

  def check
    @user = User.find(current_user.id)
  end

  def name_confirm; end
  def name_check
    if request.post?
      email = params[:email]
      password = params[:password]
      if email.nil? || password.nil?
        render plain: "パラメータが不足しています", status: :bad_request
      else
        @user = User.find_by(email: email)
        if @user && @user.valid_password?(password)
          redirect_to show_name_check_path(@user), notice: "現在のユーザー名は #{@user.name} です。"
        else
          redirect_to name_confirm_path, notice: "メールまたはパスワードが間違っています。"
        end
      end
    elsif request.get?
      @user = User.find_by(id: params[:id])
      if @user.nil?
        render plain: "ユーザーが見つかりません", status: :not_found
      end
    end
  end
  def withdrawal
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_user_registration_path
  end
end
