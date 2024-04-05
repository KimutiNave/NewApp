# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

every 1.day do
  runner "NotificationSetting.send_daily_notifications"
end

every 1.week do
  runner "NotificationSetting.send_week_notifications"
end

every 1.month, at: '10:00 am' do
  runner "NotificationSetting.send_monthly_notifications"
end 

# Learn more: http://github.com/javan/whenever
