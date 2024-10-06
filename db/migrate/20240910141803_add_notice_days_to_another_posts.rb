class AddNoticeDaysToAnotherPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :another_posts, :notice_days, :integer, default: 0
  end
end
