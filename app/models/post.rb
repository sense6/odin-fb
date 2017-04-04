class Post < ApplicationRecord
  belongs_to :user

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"],
  file_name: { matches: [/png\z/, /jpe?g\z/, /gif\z/] },
  size: { less_than: 2.megabytes }

  has_many :comments, dependent: :destroy
  has_many :commenting_users, :through => :comments, :source => :user

  has_many :likes, dependent: :destroy
  has_many :liking_users, :through => :likes, :source => :user
end
