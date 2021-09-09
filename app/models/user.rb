class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:github]
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :sent_friend_requests, foreign_key: "sender_id", class_name: "FriendRequest"
  has_many :received_friend_requests, foreign_key: "receiver_id", class_name: "FriendRequest"
  has_many :friend_relationships
  has_many :friends, foreign_key: "friend_id", class_name: "FriendRelationship"
  has_one_attached :image

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def email_required?
    false
  end
  
  def email_changed?
    false
  end
end
