module NotificationSettingsHelper
  def unchecked_notifications
    @notification_settings = current_user.active_notification_settings.where(check: false)
  end
end
