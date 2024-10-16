class CreateAlerms < ActiveRecord::Migration[7.0]
  def change
    create_table :alerms do |t|
      t.boolean :notice, default: false
      t.references :another_post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :file_type, foreign_key: true

      t.timestamps
    end
  end
end
