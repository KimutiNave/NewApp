class Post < ApplicationRecord
  validates :title, length: { maximum: 500 }
  validates :other_file_name, length: { maximum: 500 }
  validates :code_content, length: { maximum: 30000 }
  validates :other_content, length: { maximum: 10000 }
end
