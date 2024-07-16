class NotificationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :notify_days, :post_id


  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      NotificationSetting.create!(post_id: post_id, notify_days: notify_days)
    end
  end
end
