class AnotherPost < ApplicationRecord
  belongs_to :user
  belongs_to :file_type, optional: true

  validates :other_error_name, length: { maximum: 5000 }, allow_blank: true
  validates :title, length: { maximum: 500 }, allow_blank: true
  validates :other_file_name, length: { maximum: 500 }, allow_blank: true
  validates :code_content, length: { maximum: 30000 }, allow_blank: true
  validates :other_content, length: { maximum: 10000 }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    ["error_type_name", "status_error_name", "other_error_name", "title", "file_type_id", "id", "other_file_name", "code_content", "other_content", "created_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "file_type"]
  end
  
  enum status_error_name: { name_error: "Name Error", no_method_error: "No Method Error", template_is_missing: "Template is missing", load_error: "LoadError", actioncontroller_unknown_format: "Actioncontroller::UnknownFormat", argument_error: "ArgumentError", syntax_error: "Syntax error", other: "その他" }
  def humanized_status_error_name
    self.class.status_error_names[self.status_error_name]
  end
end
