class AnotherPost < ApplicationRecord
  belongs_to :user
  belongs_to :file_type, optional: true
  has_many :favorites, dependent: :destroy
  has_many :alerms, dependent: :destroy

  enum notice_days: { noalerm: 0, minute: 1, day: 2, week: 3, month: 4 }

  enum status_error_name: {"Name Error" => "Name Error", "No Method Error" => "No Method Error",
    "Template is missing" => "Template is missing", "LoadError" => "LoadError", "Actioncontroller::UnknownFormat" => "Actioncontroller::UnknownFormat", 
    "ArgumentError" => "ArgumentError", "Syntax error" => "Syntax error", "その他" => "その他"
  }

  def self.ransackable_attributes(auth_object = nil)
    ["error_type_name", "status_error_name", "other_error_name", "title", "file_type_id", "id", "other_file_name", "code_content", "other_content", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "file_type"]
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user)
  end
end
