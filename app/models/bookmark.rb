class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :file_type
  belongs_to :notification_setting
end
