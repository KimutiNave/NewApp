class PostNotificationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :save_type_name, :string
  attribute :title, :string
  attribute :file_type_id, :integer
  attribute :other_file_name, :string
  attribute :code_content, :string
  attribute :other_content, :string
  attribute :notify_days, :integer
  attribute :user_id, :integer

  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      post = Post.create!(save_type_name: save_type_name, title: title, file_name: file_type_id, other_file_name: other_file_name, code_content: code_content, other_content: other_content, user_id: user_id)
      otification = NotificationSetting.create!(notify_days: notify_days)
    end
  end
end
