class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'User', foreign_key: :post_id
  after_save :update_like_counter

  private

  def update_like_counter
    post = Post.find(post_id)
    post.increment!(:likes_counter)
  end
end
