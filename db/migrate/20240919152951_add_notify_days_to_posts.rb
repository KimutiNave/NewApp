class AddNotifyDaysToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :notify_days, :integer, default: 0
  end
end
