class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def update_comment_counter(id)
    new_counter = Comment.where(post_id: id).count
    Post.where(id: id).update(comments_counter: new_counter)
  end
end
