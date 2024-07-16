class AddCheckToNotificationSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :notification_settings, :check, :boolean
  end
end
