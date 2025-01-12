class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[twitter2 google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :another_posts, dependent: :destroy
  # 通知機能
  has_many :notification_settings, dependent: :destroy
  has_many :alerms, dependent: :destroy
  # お気に入り機能
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  has_many :favorites, dependent: :destroy
  has_many :favorite_another_posts, through: :favorites, source: :another_post

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, unless: :uid? 

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.skip_confirmation!
      user.email = auth.info.email || User.dummy_email(auth)
      user.name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def own?(object)
    id == object.user_id
  end

  # メールの確認認証のスキップ
  def skip_confirmation!
    self.confirmed_at = Time.now
  end
  
  # post用のお気に入り
  def bookmark(post)
    bookmark_posts << post
  end

  def unbookmark(post)
    bookmark_posts.destroy(post)
  end

  def bookmark?(post)
    bookmark_posts.include?(post)
  end

  # another_post用のお気に入り
  def favorite(another_post)
    favorite_another_posts << another_post
  end

  def unfavorite(another_post)
    favorite_another_posts.destroy(another_post)
  end

  def favorite?(another_post)
    favorite_another_posts.include?(another_post)
  end

  private
  # X(Twitter)用のダミーメールの作成
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
