class Alerm < ApplicationRecord
  belongs_to :another_post
  belongs_to :user
  belongs_to :file_type
end
