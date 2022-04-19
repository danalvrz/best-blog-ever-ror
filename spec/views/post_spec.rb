require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before :each do
    @user = User.find_by(email: 'harry@magic.com')
    if @user.nil?
      @user = User.create(name: 'Harry Doe', photo: 'no-photo.jpg', bio: 'Ok wizard', password: '123456',
                          email: 'harry@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
    end

    @post = Post.find_by(title: 'Post #1')
    if @post.nil?
      @post = Post.create(author: @user, title: 'Post #1', text: 'Post #1', comments_counter: 0,
                          likes_counter: 0)
    end

    if @post.comments.empty?
      @comment1 = Comment.create(text: 'Comment 1 text', author: @user, post: @post)
      @comment2 = Comment.create(text: 'Comment 2 text', author: @user, post: @post)
    else
      @comment1 = @post.comments.find(1)
      @comment2 = @post.comments.find(2)
    end
  end

  describe 'index' do
    before :each do
      visit "/users/#{@user.id}/posts"
    end

    it 'Shows the user\'s profile picture' do
      all_images = page.all('img')
      expect(all_images.count).to eq(1)
    end

    it 'Shows the user\'s username' do
      expect(page.find('h2', text: 'Harry Doe')).to be_truthy
    end

    it 'Shows the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it 'Shows a post\'s title' do
      expect(page).to have_content(@post.title)
    end

    it 'Shows some of post\'s body' do
      expect(page).to have_content(@post.text)
    end

    it 'Shows first comments on a post' do
      expect(page).to have_content(@post.comments.first.text)
    end

    it 'Shows the number of comments the post has' do
      expect(page).to have_content("Comments: #{@post.comments.count}")
    end

    it 'Shows the number of likes the post has' do
      expect(page).to have_content("Likes: #{@post.likes.count}")
    end

    it 'Directs to correct post when a link is clicked on' do
      click_link "Post ##{@post.id}"
      expect(page).to have_current_path("/users/#{@post.author_id}/posts/#{@post.id}")
    end
  end

  describe 'show' do
    before :each do
      visit "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'Shows a post\'s title' do
      expect(page).to have_content(@post.title)
    end

    it 'Shows a post\'s author' do
      expect(page).to have_content("by #{@post.author.name}")
    end

    it 'Shows the number of comments the post has' do
      expect(page).to have_content("Comments: #{@post.comments.count}")
    end

    it 'Shows the number of likes the post has' do
      expect(page).to have_content("Likes: #{@post.likes.count}")
    end

    it 'Shows post\'s body' do
      expect(page).to have_content(@post.text)
    end

    it 'Shows username for each comment' do
      expect(page).to have_content("#{@comment1.author.name}: #{@comment1.text}")
    end
  end
end
