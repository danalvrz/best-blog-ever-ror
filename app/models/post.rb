class Post < ApplicationRecord
    has_many :comments, foreign_key: :author_id
    has_many :likes, foreign_key: :author_id
    belongs_to :author, class_name: 'User', foreign_key: :author_id

    def update_post_counter(id)
        new_counter = Post.where(author_id: id).count
        User.where(id: id).update(posts_counter: new_counter)
    end

    def recent_comments
        self.comments.order(created_at: :desc).limit(5)
    end
end
