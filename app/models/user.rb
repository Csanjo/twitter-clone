class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"

  has_many :followees, through: :followed_users, source: :followee

  has_many :follower_users, foreign_key: :followed_id, class_name: "Following"

  has_many :followers, through: :follower_users, source: :follower

  def follow(user)
    followed_users.create(followed_id: user.id)
  end

  def unfollow(user)
    followed_users.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followees.include?(user)
  end

  def liked?(tweet)
    favorites.exists?(tweet_id: tweet)
  end
end
