require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :all do
    @first_user = User.find_by(email: 'harry@magic.com')
    @second_user = User.find_by(email: 'ron@magic.com')
    @third_user = User.find_by(email: 'hermdoe@magic.com')

    if @first_user.nil?
      @first_user = User.create(name: 'Harry Doe', photo: 'no-photo.jpg', bio: 'Ok wizard', password: '123456',
                                email: 'harry@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
    end

    if @second_user.nil?
      @second_user = User.create(name: 'Ron Doe', photo: 'no-photo.jpg', bio: 'Bad wizard', password: '123456',
                                 email: 'ron@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
    end

    if @third_user.nil?
      @third_user = User.create(name: 'Herm Doe', photo: 'no-photo.jpg', bio: 'Great wizard', password: '123456',
                                email: 'hermdoe@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
    end
  end

  describe 'index' do
    before :all do
      @first_user = User.find_by(name: 'Harry Doe')
      @second_user = User.find_by(name: 'Ron Doe')
      @third_user = User.find_by(name: 'Herm Doe')

      if @first_user.nil?
        @first_user = User.create(name: 'Harry Doe', photo: 'no-photo.jpg', bio: 'Ok wizard', password: '123456',
                                  email: 'harry@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
      end

      if @second_user.nil?
        @second_user = User.create(name: 'Ron Doe', photo: 'no-photo.jpg', bio: 'Bad wizard', password: '123456',
                                   email: 'ron@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
      end

      if @third_user.nil?
        @third_user = User.create(name: 'Herm Doe', photo: 'no-photo.jpg', bio: 'Great wizard', password: '123456',
                                  email: 'herm@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
      end
    end

    before :each do
      visit '/'
    end

    it 'shows the names of all users' do
      expect(page).to have_content('Harry Doe')
      expect(page).to have_content('Ron Doe')
      expect(page).to have_content('Herm Doe')
    end

    it 'Shows the profile picture of each user' do
      all_images = page.all('img')
      expect(all_images.count).to eq(User.all.count)
    end

    it 'Shows the number of posts each user has published' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'When a user link is clocked, it redirectes to correct user show page' do
      click_link 'Herm Doe'
      expect(page).to have_current_path(user_path(@third_user.id))
    end
  end

  describe 'show' do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: 'harry@magic.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @post1 = Post.find_by(title: 'Post #1')
      @post2 = Post.find_by(title: 'Post #2')
      @post3 = Post.find_by(title: 'Post #3')

      if @post1.nil?
        @post1 = Post.create(author: @first_user, title: 'Post #1', text: 'Post #1', comments_counter: 0,
                             likes_counter: 0)
      end

      if @post2.nil?
        @post2 = Post.create(author: @first_user, title: 'Post #2', text: 'Post #2', comments_counter: 0,
                             likes_counter: 0)
      end

      if @post3.nil?
        @post3 = Post.create(author: @first_user, title: 'Post #3', text: 'Post #3', comments_counter: 0,
                             likes_counter: 0)
      end
    end

    before :each do
      visit "/users/#{@first_user.id}"
    end

    it 'Shows the user\'s profile photo' do
      all_images = page.all('img')
      expect(all_images.count).to eq(1)
    end

    it 'Shows the correct path' do
      expect(page).to have_current_path("/users/#{@first_user.id}")
    end

    it 'Shows the user correct name' do
      expect(page.find('h2', text: 'Harry Doe')).to be_truthy
    end

    it 'Shows the number of posts that user has written.' do
      expect(page).to have_content("Number of posts: #{@first_user.posts.count}")
    end

    it 'Shows the user\'s bio.' do
      expect(page).to have_content(@first_user.bio)
    end

    it 'Shows user\'s first 3 posts.' do
      expect(page.find_all('div', class: ['post-card']).count).to eq(3)
    end

    it 'When a post title is clicked, it redirects to correct post show page' do
      click_link 'See all posts'
      click_link "Post ##{@post1.id}"
      expect(page).to have_current_path("/users/#{@post1.author_id}/posts/#{@post1.id}")
    end
  end
end
