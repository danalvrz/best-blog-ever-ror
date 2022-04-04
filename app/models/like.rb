class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'User', foreign_key: :post_id

  def update_like_counter(id)
    new_counter = Like.where(post_id: id).count
    Post.where(id: id).update(likes_counter: new_counter)
  end
end
