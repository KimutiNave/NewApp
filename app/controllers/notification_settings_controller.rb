class NotificationSettingsController < ApplicationController
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
    params.require(:notification_setting).permit(:notify_days, :post_id)
  end
end
