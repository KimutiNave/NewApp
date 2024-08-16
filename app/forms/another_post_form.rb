class AanotherPostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user_id, :error_type_name, :status_error_name, :other_error_name, :title, :file_type_id, :other_file_name, :code_content, :other_content

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
      AnotherPost.create(
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
      #self.another_post_id = another_post.id(attr_accessorにanother_post_idを入れること)
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
      other_content: another_post.other_content
    }
  end
end