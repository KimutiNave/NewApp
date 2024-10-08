class FileType < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :another_posts, dependent: :destroy
  has_many :notification_settings, dependent: :destroy
  has_many :alerms, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["file_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["post", "another_post"]
  end
end
