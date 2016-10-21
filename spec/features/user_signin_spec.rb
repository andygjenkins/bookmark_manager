require 'spec_helper'


feature 'signing in' do

  let!(:user) do
     User.create(email: 'mak@on.com',
                password: 'abc',
                password_confirmation: 'abc')
  end

  def sign_in(email:, password:)
    visit('/sessions/new')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  scenario 'a user can sign in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Hello #{user.email}")
  end
end
