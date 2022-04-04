class Comment < ApplicationRecord
    belongs_to :post, class_name: 'Post', foreign_key: :post_id
    belongs_to :author, class_name: 'User', foreign_key: :author_id

    def update_comment_counter(id)
        new_counter = Comment.where(post_id: id).count
        Post.where(id: id)update(comments_counter: new_counter)
    end
end

# first_post = Post.create(author: User.find_by(id: 3), title: 'Hello', text: 'This is my first post')
# second_post = Post.create(author: User.find_by(id: 3), title: 'Hi', text: 'This is my second post')
# third_post = Post.create(author: User.find_by(id: 4), title: 'Goodbye', text: 'This is my third post')
# fourth_post = Post.create(author: User.find_by(id: 4), title: 'Ciao', text: 'This is my fourth post')

# Comment.create(post: Post.find_by(id: 1), author: User.find_by(id: 3), text: 'Hi Tom!')
# Comment.create(post: Post.find_by(id: 1), author: User.find_by(id: 4), text: 'Hi Lilly!')
# Comment.create(post: Post.find_by(id: 1), author: User.find_by(id: 3), text: 'How are you, Tom?')
# Comment.create(post: Post.find_by(id: 1), author: User.find_by(id: 4), text: 'Good, and you?')
# Comment.create(post: Post.find_by(id: 1), author: User.find_by(id: 3), text: 'Great!')
# Comment.create(post: Post.find_by(id: 1), author: User.find_by(id: 4), text: 'Sweet!')