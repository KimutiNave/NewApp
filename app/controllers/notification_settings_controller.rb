class NotificationSettingsController < ApplicationController
  def index
    @notification_settings = current_user.notification_settings.order(created_at: :desc).distinct.page(params[:page]).per(20)
    # 未読の通知を「既読に更新」
    @notification_settings.where(check: false).each do |notification_setting|
      notification_setting.update(check: true)
    end
  end

  def destroy_all
    @notification_settings = current_user.notification_settings.destroy_all
    redirect_to notification_settings_path
  end
end
