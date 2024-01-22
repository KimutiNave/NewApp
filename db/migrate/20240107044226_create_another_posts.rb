class CreateAnotherPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :another_posts do |t|
      t.string :error_type_name
      t.string :status_error_name
      t.string :title
      t.text :code_content
      t.text :other_content

      t.timestamps
    end
  end
end
