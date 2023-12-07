class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.string :file_name
      t.text :code_content
      t.text :other_content

      t.timestamps
    end
  end
end
