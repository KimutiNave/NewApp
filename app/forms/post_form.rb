class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user_id, :save_type_name, :title, :file_type_id, :other_file_name, :code_content, :other_content, :post_id, :notify_days, :date

  validates :title, length: { maximum: 500 }, allow_blank: true
  validates :other_file_name, length: { maximum: 500 }, allow_blank: true
  validates :code_content, length: { maximum: 30000 }, allow_blank: true
  validates :other_content, length: { maximum: 10000 }, allow_blank: true

  # postがすでに保存されているものか、新規のものかで、PUTとPATCHを分ける
  delegate :persisted?, to: :post

  # Formオブジェクトの初期化と更新の際にdefault_attributesを呼び出す設定
  def initialize(attributes = nil, post: Post.new)
    @post = post
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      post = Post.create(
        user_id: user_id,
        save_type_name: save_type_name,
        title: title,
        file_type_id: file_type_id,
        other_file_name: other_file_name,
        code_content: code_content,
        other_content: other_content,
      )
      self.post_id = post.id
      @notification_settings = NotificationSetting.create(user_id: user_id, post_id: post_id, notify_days: notify_days, date: Time.current.to_date)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
  
  def update_post
    ActiveRecord::Base.transaction do
      post.update(user_id:, save_type_name:, title:, file_type_id:, other_file_name:, code_content:, other_content:)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
  #通知用のメソッド
  def create_notification_setting!(current_user)
    #binding.pry
    if @notification_settings.notify_days.present? && @notification_settings.notify_days.in?(%w[day week month])
      temp = NotificationSetting.where(user_id: current_user.id, post_id: post_id, notify_days: notify_days).distinct
      if temp.blank?
        notification_setting = current_user.active_notification_settings.new(
          user_id: current_user.id,
          post_id: post_id,
          notify_days: notify_days,
          date: Time.current
        )
        notification_setting.save if notification_setting.valid?
      end
    end
  end

  private

  attr_reader :post

  def default_attributes
    {
      user_id: post.user_id,
      save_type_name: post.save_type_name,
      title: post.title,
      file_type_id: post.file_type_id,
      other_file_name: post.other_file_name,
      code_content: post.code_content,
      other_content: post.other_content
    }
  end
end
