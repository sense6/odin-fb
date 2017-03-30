class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :sent_invites, :class_name => 'Invite', :foreign_key => :sender_id
  has_many :receved_invites, :class_name => 'Invite', :foreign_key => :recever_id

  has_many :posts

  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
