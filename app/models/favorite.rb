class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :another_post
  belongs_to :file_type
  belongs_to :notification_setting
end
