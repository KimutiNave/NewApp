class AddConfirmnToAnotherPost < ActiveRecord::Migration[7.0]
  def change
    add_column :another_posts, :confirmn, :boolean
  end
end
