require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
    author = User.new(name: "Tom")
    post = Post.new(title: "Star Wars", author_id: author.id, text: "This is a test", comments_counter: 1, likes_counter: 1)
    subject { Comment.new(text: "Test comment", author_id: author.id, post_id: post.id) }

    before(:each) { subject.save }

    it 'refers to correct post' do
        expect(subject.post_id).to be(post.id)
    end

    it 'refers to correct author' do
        expect(subject.author_id).to be(author.id)
    end

    it 'saves correct text' do
        expect(subject.text).to eq("Test comment")
    end

    it 'comments_counter updates authors counter' do
        post.increment!(:comments_counter)
        expect(post.likes_counter).to be(1)
    end

end