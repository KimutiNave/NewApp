class AddFileTypeRefToAnotherPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :another_posts, :file_types, null: false, foreign_key: true
  end
end
