class AddVerifyToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :verify, :boolean, default: false
  end
end
