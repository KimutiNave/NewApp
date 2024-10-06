class AddNameToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :name, :string, null: false
  end
end
