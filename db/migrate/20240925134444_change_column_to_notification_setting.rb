class ChangeColumnToNotificationSetting < ActiveRecord::Migration[7.0]
  def change
    remove_reference :notification_settings, :another_post
  end
end
