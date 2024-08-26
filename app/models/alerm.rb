class Alerm < ApplicationRecord
  belongs_to :another_post
  belongs_to :user
  belongs_to :file_type, optional: true
  
  enum notice_days: {default: 0, minute: 1, day: 2, week: 3, month: 4}
end
