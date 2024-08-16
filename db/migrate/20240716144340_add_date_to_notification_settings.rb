class AddDateToNotificationSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :notification_settings, :date, :date, null: false
  end
end
