class NotificationSetting < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :file_type, optional: true
  has_many :bookmarks, dependent: :destroy

  enum notify_days: {default: 0, day: 1, week: 2, month: 3}

  #def self.send_daily_notifications
    #NotificationSetting.find_each do |setting|
      #user = setting.user
      #if setting.notify_days.present? && (Date.today - user.posts.last.created_at.to_date).to_i % setting.notify_days == 0
       #Notification.create(user: user, post: setting.post, another_post: setting.another_post, file_type: setting.file_type, message: "#{setting.post.title}の作成した記事があります")
      #else
        #Rails.logger.info "通知の作成はありません"
      #end
    #end
  #end

  #def self.send_week_notifications
    #NotificationSetting.find_each do |setting|
      #user = setting.user
      # 例: ユーザーが設定した日数が7の倍数の場合（毎週）通知
      #if setting.notify_days.present? && setting.notify_days % 7 == 0
        #posts = user.posts.where('created_at <= ?', setting.notify_after.days.ago)
      
        #posts.each do |post|
          # ここでユーザーに通知を送る
        #end
      #end
    #end
  #end

  #def self.send_monthly_notifications
    #NotificationSetting.find_each do |setting|
      #user = setting.user
      # 毎月通知を送るロジック。例えば、ユーザーが最後に投稿した日から1カ月経過した場合に通知
      #user.posts.where('created_at <= ?', 1.month.ago).each do |post|
        # ここでユーザーに通知を送るロジック。例えば、メールを送る、アプリ内通知をするなど。
      #end
    #end
  #end
end
