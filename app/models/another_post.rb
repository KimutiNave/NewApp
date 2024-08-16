class AnotherPost < ApplicationRecord
  belongs_to :user
  belongs_to :file_type, optional: true
  has_many :favorites, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["error_type_name", "status_error_name", "other_error_name", "title", "file_type_id", "id", "title other_file_name", "code_content", "other_content", "created_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "file_type"]
  end
  
  enum status_error_name: ["Name Error", "No Method Error", "Template is missing", "LoadError", "Actioncontroller::UnknownFormat", "ArgumentError", "Syntax error", "その他"]

  def favorited_by?(user)
    favorites.exists?(user_id: user)
  end
end
