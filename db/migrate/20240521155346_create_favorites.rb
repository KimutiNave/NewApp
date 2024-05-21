class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :another_post, null: false, foreign_key: true
      t.references :file_type, foreign_key: true
      t.references :notification_setting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
