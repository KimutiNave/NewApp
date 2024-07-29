class NotificationSettingsController < ApplicationController
  def index
    @notification_settings = current_user.active_notification_settings.order(created_at: :desc).page(params[:page]).per(20)
    # 未読の通知を「既読に更新」
    #binding.pry
    @notification_settings.where(check: false).each do |notification_setting|
      notification_setting.update_attributes(check: true)
    end
  end


  def create
    if @post_form.save_post
      @post_form.post.create_notification_setting!(current_user) if @post_form.notify_days.present?
      case @notification_setting.notify_days
      when 'day'
        NotificationSetting.where('date <= ?', 1.minute.ago) #1.day.ago)
      when 'week'
        NotificationSetting.where('date <= ?', 1.week.ago)
      when 'month'
        NotificationSetting.where('date <= ?', 1.month.ago)
      end
      redirect_to notification_settings_path(current_user), notice: '通知設定を保存しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def notification_setting_params
    params.require(:notification_setting).permit(:user_id, :notify_days, :post_id, :file_type_id)
  end
end
