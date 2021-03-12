class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :active_followships,
            class_name: "Followship",
            foreign_key: "follower_id",
            dependent: :destroy

  has_many :passive_followships,
            class_name: "Followship",
            foreign_key: "followee_id",
            dependent: :destroy

  has_many :followees, through: :active_followships, source: :followee
  has_many :followers, through: :passive_followships, source: :follower

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

  def follow(other_user)
    followees << other_user
  end

  def unfollow(other_user)
    followees.delete other__user
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
