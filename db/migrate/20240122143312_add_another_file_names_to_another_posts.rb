class AddAnotherFileNamesToAnotherPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :another_posts, :other_file_name, :string
    add_column :another_posts, :other_error_name, :string
  end
end
