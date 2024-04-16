class CreateNotificationSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :notification_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, foreign_key: true
      t.references :another_post, foreign_key: true
      t.references :file_type, foreign_key: true
      t.integer :notify_days

      t.timestamps
    end
  end
end
