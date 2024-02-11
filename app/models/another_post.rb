class AnotherPost < ApplicationRecord
  belongs_to :user

  validates :other_error_name, length: { maximum: 5000 }
  validates :title, length: { maximum: 500 }
  validates :other_file_name, length: { maximum: 500 }
  validates :code_content, length: { maximum: 30000 }
  validates :other_content, length: { maximum: 10000 }
  
  enum status_error_name: ["Name Error", "No Method Error", "Template is missing", "LoadError", "Actioncontroller::UnknownFormat", "ArgumentError", "Syntax error", "その他"]
end
