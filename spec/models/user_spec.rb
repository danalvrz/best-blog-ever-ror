require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jenny', posts_counter: 8) }

  before(:each) { subject.save }

  it 'name has to be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an number' do
    subject.posts_counter = 'xyz'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -8
    expect(subject).to_not be_valid
  end

  it 'recet_posts should return 0 for new users' do
    expect(subject.recent_posts.count).to be(0)
  end
end
