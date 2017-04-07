class Post < ApplicationRecord
  belongs_to :user

  #has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  self.per_page = 10

  has_many :comments, dependent: :destroy
  has_many :commenting_users, :through => :comments, :source => :user

  has_many :likes, dependent: :destroy
  has_many :liking_users, :through => :likes, :source => :user
end
