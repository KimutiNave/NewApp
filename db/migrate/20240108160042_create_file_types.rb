class CreateFileTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :file_types do |t|
      t.string :file_name

      t.timestamps
    end
  end
end