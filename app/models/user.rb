class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
