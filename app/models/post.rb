class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    has_many :comments
    has_many :likes
  
    validates :author_id, presence: true
    validates :title, presence: true
    validates :text, presence: true
  
    after_save :update_post_counter
  
    private
  
    def update_post_counter
      update(posts_counter: posts.count)
    end
  end
  