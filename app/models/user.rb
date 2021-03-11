class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :follower_followships,
            class_name: "Followship",
            foreign_key: "follower_id",
            dependent: :destroy

  has_many :followee_followships,
            class_name: "Followship",
            foreign_key: "followee_id",
            dependent: :destroy

  has_many :followees, through: :follower_followships
  has_many :followers, through: :followee_followships

  validates :name, presence: true,
                      length: { minimum: 4, maximum: 96 }

  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                  uniqueness: { case_sensitive: false },
                  length: { maximum: 105 },
                  format: { with: VALID_EMAIL_REGEX }

  def follow(user)
    followees << user
  end

  def unfollow(followed_user)
    followees.delete followed_user
  end

end
