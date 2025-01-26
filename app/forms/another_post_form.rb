class AnotherPostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user_id, :error_type_name, :status_error_name, :other_error_name, :title, :file_type_id, :other_file_name, :code_content, :other_content, :confirmn, :notice_days
  
  validates :status_error_name, inclusion: { in: AnotherPost.status_error_names.keys }, allow_blank: true
  validates :other_error_name, length: { maximum: 5000 }, allow_blank: true
  validates :title, length: { maximum: 500 }, allow_blank: true
  validates :other_file_name, length: { maximum: 500 }, allow_blank: true
  validates :code_content, length: { maximum: 30000 }, allow_blank: true
  validates :other_content, length: { maximum: 10000 }, allow_blank: true

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
      another_post = AnotherPost.create(user_id:, error_type_name:, status_error_name:, other_error_name:, title:, file_type_id:, other_file_name:, code_content:, other_content:, notice_days:, confirmn: false)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  # 編集用のメソッド
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
        other_content:,
        notice_days:
      )
    end
  rescue ActiveRecord::RecordInvalid
    false
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
      confirmn: another_post.confirmn,
      notice_days: another_post.notice_days
    }
  end
end
