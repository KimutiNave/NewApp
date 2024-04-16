class Post < ApplicationRecord
  belongs_to :user
  belongs_to :file_type, optional: true
  has_many :notification_settings, dependent: :destroy
  
  validates :title, length: { maximum: 500 }, allow_blank: true
  validates :other_file_name, length: { maximum: 500 }, allow_blank: true
  validates :code_content, length: { maximum: 30000 }, allow_blank: true
  validates :other_content, length: { maximum: 10000 }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    ["code_content", "created_at", "file_type_id", "id", "other_content", "other_file_name", "save_type_name", "title", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["file_type", "user"]
  end
end
