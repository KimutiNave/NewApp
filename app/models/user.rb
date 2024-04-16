class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter]

  has_many :posts, dependent: :destroy
  has_many :another_posts, dependent: :destroy
  has_many :notification_settings, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, uniqueness: true

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|      
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
