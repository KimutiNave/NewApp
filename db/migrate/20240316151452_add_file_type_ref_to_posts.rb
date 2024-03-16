class AddFileTypeRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :file_types, null: false, foreign_key: true
  end
end
