class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :sent_friend_requests, foreign_key: "sender_id", class_name: "FriendRequest"
  has_many :received_friend_requests, foreign_key: "receiver_id", class_name: "FriendRequest"
  has_many :friend_relationships
  has_many :friends, foreign_key: "friend_id", class_name: "FriendRelationship"
  has_one_attached :image
end
