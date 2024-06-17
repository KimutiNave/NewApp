class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[twitter2]

  has_many :posts, dependent: :destroy
  has_many :another_posts, dependent: :destroy
  has_many :notification_settings, dependent: :destroy
  # お気に入り機能
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  has_many :favorites, dependent: :destroy
  has_many :favorites_anotherposts, through: :favorites, source: :another_post

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, uniqueness: true

  def skip_confirmation!
    self.confirmed_at = Time.now.utc
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.from_omniauth(auth)

    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def own?(object)
    id == object.user_id
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
    favorites_anotherposts << another_post
  end

  def unfavorite(another_post)
    favorites_anotherposts.destroy(another_post)
  end

  def favorite?(post)
    favorites_anotherposts.include?(another_post)
  end
end
