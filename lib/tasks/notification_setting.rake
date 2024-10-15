namespace :notification_setting do
  desc "Create_notification_setting(30minute)"
  task create_notification_setting_timely: :environment do
    if Post.where(notify_days: "minute").exists?
      create_task_notification_setting
    end
  end

  desc "Create_notification_setting(1day)"
  task create_notification_setting_daily: :environment do
    if Post.where(notify_days: "day").exists?
      create_task_notification_setting
    end
  end

  desc "Create_notification_setting(1week)"
  task create_notification_setting_weekly: :environment do
    if Post.where(notify_days: "week").exists?
      create_task_notification_setting
    end
  end

  desc "Create_notification_setting(1month)"
  task create_notification_setting_monthly: :environment do
    if Post.where(notify_days: "month").exists?
      create_task_notification_setting
    end
  end

  def create_task_notification_setting
    notification_day = Post.where(notify_days: ["minute", "day", "week", "month"])
    if notification_day.exists?
      temp = Post.where(verify: false)
      if temp.present?
        posts = Post.all
        posts.each do |post|
          user = post.user
          notification_setting = NotificationSetting.create(
            user_id: user.id,
            post_id: post.id
          )
        end
        temp.update(verify: true)
      end
    end
  end
end
