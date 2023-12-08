class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :save
      t.string :error

      t.timestamps
    end
  end
end
