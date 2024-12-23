class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :favorites
  has_many_attached :photos

  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"

  has_many :followees, through: :followed_users, source: :followee

  has_many :follower_users, foreign_key: :followed_id, class_name: "Following"

  has_many :followers, through: :follower_users, source: :follower


end
