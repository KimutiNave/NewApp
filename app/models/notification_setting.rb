class NotificationSetting < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :another_post, optional: true
  belongs_to :file_type, optional: true

  def self.send_daily_notifications
    NotificationSetting.find_each do |setting| #←は全てのデータを取得してしまう！ NotificationSetting.whereなどで取得したいデータを設定する。
      user = setting.user
      if setting.notify_days.present? && (Date.today - user.posts.last.created_at.to_date).to_i % setting.notify_days == 0
        # ユーザーが設定した日程に基づいて通知する記事を検索
        posts = user.posts.where('created_at <= ?', setting.notify_after.days.ago)
        # 通知用のカラム用のテーブル作成
        # この機能は通知用の機能でいいね一覧用の通知のデータを保存するカラムは作成されていない。
        # 通知の内容保存
        posts.each do |post|
          NotificationSetting.create(user: user, post: post, another_post: another_post,file_type: file_type, message: "#{post.title}の作成した記事があります")
        end
      end
    end
  end

  def self.send_week_notifications
    NotificationSetting.find_each do |setting|
      user = setting.user
      # 例: ユーザーが設定した日数が7の倍数の場合（毎週）通知
      if setting.notify_days.present? && setting.notify_days % 7 == 0
        posts = user.posts.where('created_at <= ?', setting.notify_after.days.ago)
      
        posts.each do |post|
          # ここでユーザーに通知を送る
        end
      end
    end
  end

  def self.send_monthly_notifications
    NotificationSetting.find_each do |setting|
      user = setting.user
      # 毎月通知を送るロジック。例えば、ユーザーが最後に投稿した日から1カ月経過した場合に通知
      user.posts.where('created_at <= ?', 1.month.ago).each do |post|
        # ここでユーザーに通知を送るロジック。例えば、メールを送る、アプリ内通知をするなど。
      end
    end
  end
end
