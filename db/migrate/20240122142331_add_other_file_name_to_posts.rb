class AddOtherFileNameToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :other_file_name, :string
  end
end
