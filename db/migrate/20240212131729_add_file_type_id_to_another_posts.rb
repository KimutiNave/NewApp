class AddFileTypeIdToAnotherPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :another_posts, :file_type_id, :integer
  end
end
