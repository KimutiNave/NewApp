class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :another_post
  belongs_to :file_type, optional: true
  belongs_to :notification_setting, optional: true
end