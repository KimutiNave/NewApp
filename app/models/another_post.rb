class AnotherPost < ApplicationRecord
  belongs_to :user
  belongs_to :file_type

  validates :other_error_name, length: { maximum: 5000 }
  validates :title, length: { maximum: 500 }
  validates :other_file_name, length: { maximum: 500 }
  validates :code_content, length: { maximum: 30000 }
  validates :other_content, length: { maximum: 10000 }

  def self.ransackable_attributes(auth_object = nil)
    ["error_type_name", "status_error_name", "other_error_name", "title", "file_type_id", "id", "title other_file_name", "code_content", "other_content", "created_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "file_type"]
  end
  
  enum status_error_name: ["Name Error", "No Method Error", "Template is missing", "LoadError", "Actioncontroller::UnknownFormat", "ArgumentError", "Syntax error", "その他"]
end
