class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user_id, :save_type_name, :title, :file_type_id, :other_file_name, :code_content, :other_content, :verify, :notify_days

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
        verify: false,
        notify_days: notify_days
      )
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  #編集用のメソッド
  def update_post
    ActiveRecord::Base.transaction do
      post.update(user_id:, save_type_name:, title:, file_type_id:, other_file_name:, code_content:, other_content:)
    end
  rescue ActiveRecord::RecordInvalid
    false
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
      other_content: post.other_content,
      notify_days: post.notify_days
    }
  end
end
