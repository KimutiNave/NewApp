# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def reject_user
    @user = User.find_by(name: params[:user][:name], email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "該当するユーザーが見つかりません"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
