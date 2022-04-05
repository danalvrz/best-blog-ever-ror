class Post < ApplicationRecord
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :update_post_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end