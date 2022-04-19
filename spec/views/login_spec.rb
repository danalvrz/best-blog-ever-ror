require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  before :all do
    visit destroy_user_session_path
    visit '/users/sign_in'
  end

  it 'Shows username and password inputs and the "Submit" button' do
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Log in')
  end

  it 'When I click the submit button without filling nothing, I get a detailed error.' do
    visit('/users/sign_in')
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'When I click the submit button after filling with incorrect data, I get a detailed error.' do
    User.create(name: 'Harry', photo: 'photo.jpg', password: '123456',
                email: 'harry@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
    visit('/users/sign_in')
    fill_in 'Email', with: 'harry@magic.com'
    fill_in 'Password', with: '654321'
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'When I click the submit button after filling with correct data, I get logged in' do
    User.create(name: 'Harry', photo: 'photo.jpg', password: '123456',
                email: 'harry@magic.com', confirmed_at: '2022-04-16 10:14:43.057417')
    visit('/users/sign_in')
    fill_in 'Email', with: 'harry@magic.com'
    fill_in 'Password', with: '123456'
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
  end
end
