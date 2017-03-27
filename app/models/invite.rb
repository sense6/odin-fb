class Invite < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :recever, :class_name => 'User'  
end
