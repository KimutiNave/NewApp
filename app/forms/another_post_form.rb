class AnotherPostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user_id, :another_post_id, :alerm_id, :error_type_name, :status_error_name, :other_error_name, :title, :file_type_id, :other_file_name, :code_content, :other_content, :confirmn, :notice_days

  validates :other_error_name, length: { maximum: 5000 }, allow_blank: true
  validates :title, length: { maximum: 500 }, allow_blank: true
  validates :other_file_name, length: { maximum: 500 }, allow_blank: true
  validates :code_content, length: { maximum: 30000 }, allow_blank: true
  validates :other_content, length: { maximum: 10000 }, allow_blank: true
  validates :confirmn, inclusion: {in: [false, true]}

  # another_postがすでに保存されているものか、新規のものかで、PUTとPATCHを分ける
  delegate :persisted?, to: :another_post

  # Formオブジェクトの初期化と更新の際にdefault_attributesを呼び出す設定
  def initialize(attributes = nil, another_post: AnotherPost.new)
    @another_post = another_post
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    ActiveRecord::Base.transaction do
      another_post = AnotherPost.create(
        user_id: user_id,
        error_type_name: error_type_name,
        status_error_name: status_error_name,
        other_error_name: other_error_name,
        title: title,
        file_type_id: file_type_id,
        other_file_name: other_file_name,
        code_content: code_content,
        other_content: other_content,
        confirmn: false
      )
      self.another_post_id = another_post.id
      alerm = Alerm.create(user_id: user_id, another_post_id: another_post_id, notice_days: notice_days)
      self.alerm_id = alerm.id
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  #編集用のメソッド
  def update_another_post
    ActiveRecord::Base.transaction do
      another_post.update(
        user_id:,
        error_type_name:,
        status_error_name:,
        other_error_name:,
        title:,
        file_type_id:,
        other_file_name:,
        code_content:,
        other_content:
      )
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
 #通知用のメソッド
  def create_alarm!(current_user)
    temp = AnotherPost.where(notice: false)
    if notice_days.in?(%w[minute day week month])
      if temp.present?
        alerm = current_user.active_alerms.new(
          user_id: current_user.id,
          another_post_id: alerm.another_post_id
        )
        alerm.save if alerm.valid?
        temp.update(notice: true)
      else
        alerm = current_user.active_alerms.new(
          user_id: current_user.id,
          another_post_id: alerm.another_post_id
        )
      end
    end
  end

  private

  attr_reader :another_post

  def default_attributes
    {
      user_id: another_post.user_id,
      error_type_name: another_post.error_type_name,
      status_error_name: another_post.status_error_name,
      other_error_name: another_post.other_error_name,
      title: another_post.title,
      file_type_id: another_post.file_type_id,
      other_file_name: another_post.other_file_name,
      code_content: another_post.code_content,
      other_content: another_post.other_content,
      confirmn: another_post.confirmn
    }
  end
end