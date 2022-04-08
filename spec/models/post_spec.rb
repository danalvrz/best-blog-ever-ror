require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  author = User.new(name: 'Tom')
  subject do
    Post.new(title: 'Star Wars', author_id: author.id, text: 'This is a test', comments_counter: 1, likes_counter: 1)
  end

  before(:each) { subject.save }

  it 'title has to be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'saves correct author' do
    expect(subject.author_id).to equal(author.id)
  end

  it 'text is no longer that 250' do
    subject.text = 'test' * 45
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be a number' do
    expect(subject.comments_counter).to be(1)
  end

  it 'likes_counter should be a number' do
    expect(subject.comments_counter).to be(1)
  end

  it 'posts_counter updates authors counter' do
    author.increment!(:posts_counter)
    expect(author.posts_counter).to be(1)
  end
end
