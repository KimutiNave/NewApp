class Post < ApplicationRecord
  belongs_to :user
  belongs_to :file_type, optional: true
  has_many :notification_settings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  enum notify_days: {default: 0, minute: 1, day: 2, week: 3, month: 4}

  def self.ransackable_attributes(auth_object = nil)
    ["code_content", "created_at", "file_type_id", "id", "other_content", "other_file_name", "save_type_name", "title", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["file_type", "user"]
  end

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user)
  end
end
