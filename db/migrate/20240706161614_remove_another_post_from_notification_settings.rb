class RemoveAnotherPostFromNotificationSettings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :notification_settings, :another_post, null: false, foreign_key: true
  end
end
