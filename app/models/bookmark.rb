class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :file_type, optional: true
  belongs_to :notification_setting, optional: true

  validates :user_id, uniqueness: {scope: :post_id}
end
