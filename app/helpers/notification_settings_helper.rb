module NotificationSettingsHelper
  def unchecked_notifications
    @notification_settings = current_user.active_notification_settings.where(check: false).where.not(notify_days: "default")
    #notfify = current_user.active_notification_settings.where(check: false)
    #@notification_settings = notfify
    #if notfify.where(notify_days: 'day').exists?
      #future_time = Time.current + 1.minute
      #@notification_settings = notfify.where("date <= ?", future_time)
    
    #elsif notfify.where(notify_days: 'week').exists?
      #@notification_settings = notfify.where("date <= ?", Time.current + 1.week)
    
   # elsif notfify.where(notify_days: 'month').exists?
      #@notification_settings = notfify.where("date <= ?", Time.current + 1.month)
    
    #else  
      #@notification_settings = notfify.where.not(notify_days: 'default')
    #end
  end
end
