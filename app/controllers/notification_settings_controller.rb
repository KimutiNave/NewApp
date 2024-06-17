class NotificationSettingsController < ApplicationController
  def index
    @notifications = current_user.notification_settings.order(created_at: :desc).page(params[page]).per(20)
  end
  
  def new
    @notification_setting = NotificationSetting.new
  end

  def create
    @notification_setting = current_user.build_notification_setting(notification_setting_params)
    if @notification_setting.save
      redirect_to top_path(current_user), notice: '通知設定を保存しました。'
    else
      render :new
    end
  end

  private

  def notification_setting_params
    params.require(:notification_setting).permit(:user_id, :notify_days, :post_id, :another_post_id, :file_type_id)
  end
end
