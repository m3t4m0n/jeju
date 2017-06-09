class Poster < ActiveRecord::Base
    belongs_to :user
    has_many :replies
    
    has_many :users, through: :like_posts
    has_many :replies
    has_many :like_posts
    
    mount_uploader :image, AvatarUploader

    acts_as_taggable
end
