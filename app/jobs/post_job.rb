class PostJob < ApplicationJob
  queue_as :default

  #def perform(id)
    #notification_setting = NotificationSetting.find(params[:id])
    #temp = NotificationSetting.where(user_id: current_user.id, post_id: post_id, notify_days: notify_days).distinct
    #if temp.blank?
     # notification_setting = current_user.active_notification_settings.new(
        #user_id: current_user.id,
        #post_id: notification_setting.post_id,
        #notify_days: notification_setting.notify_days,
        #date: Time.current
      #)
      #notification_setting.save if notification_setting.valid?
    #end
    #PostJob.set(wait: 1.minute).perform_later(current_user.id, notification_setting.post_id, notification_setting.notify_days)
  #end
end
