class Post < ActiveRecord::Base
    has_many :replies
    belongs_to :user
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
    validates :title, presence: true
end
