# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
#Rails.rootを使用するために必要
require.File.expand_path(File.dirname(__FILE__) + '/environment')
# 事故防止の為RAILS_ENVの指定が無い場合にはdevelopmentを使用する
rails_env = ENV['RAILS_ENV'] || :development

set :environment, rails_env 
set :output, "/path/to/my/cron_log.log"

if rails_env.to_sym == :production
  # production環境のみで設定
end
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

every 1.day, at: '10:00 am' do
  runner "NotificationSetting.send_daily_notifications"
end

every 1.week, at: '10:00am' do
  runner "NotificationSetting.send_week_notifications"
end

every 1.month, at: '10:00 am' do
  runner "NotificationSetting.send_monthly_notifications"
end 

# Learn more: http://github.com/javan/whenever
