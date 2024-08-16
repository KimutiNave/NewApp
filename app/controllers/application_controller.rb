class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_notifications

  # def set_notifications
   #ユーザーが通知を受け取る日程を設定
    # @notification_settings = current_user.notification_settings.where(read: false) if user_signed_in?
  # end

  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    top_path
  end

  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  #ログイン時にnameパラメーターを許可する。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  end
end
