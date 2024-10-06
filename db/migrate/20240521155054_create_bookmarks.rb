class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.references :file_type, null: true, foreign_key: true
      t.references :notification_setting, null: true, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, [:user_id, :post_id], unique: :true
  end
end
