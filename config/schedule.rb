# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
#Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')
# 事故防止の為RAILS_ENVの指定が無い場合にはdevelopmentを使用する
#rails_env = ENV['RAILS_ENV'] || :development
# 本番環境
rails_env = ENV['RAILS_ENV'] || :production
#開発環境用に設定
set :environment, rails_env
set :environment, :production #本番環境用
set :output, "#{Rails.root}/log/cron.log"

#if rails_env.to_sym == :production
  #production環境のみで設定
#end

#AnotherPostFormでのAlerm通知(Fly.ioではcrontabを使用なのでコメント)

every 30.minute do
  rake 'alerm:create_alerm_timely'
end

every 1.day do
  rake 'alerm:create_alarm_daily'
end

every 1.week do
  rake 'alerm:create_alarm_weekly'
end

every 1.month do
  rake 'alerm:create_alerm_monthly'
end 

#NotificationSettingの通知モデル(Fly.ioではcrontabを使用なのでコメント)

every 30.minute do
  rake 'notification_setting:create_notification_setting_timely'
end

every 1.day do
  rake 'notification_setting:create_notification_setting_daily'
end

every 1.week do
  rake 'notification_setting:create_notification_setting_weekly'
end

every 1.month do
  rake 'notification_setting:create_notification_setting_monthly'
end 

# Learn more: http://github.com/javan/whenever
