class NotificationSetting < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :file_type, optional: true
  has_many :bookmarks, dependent: :destroy
end
