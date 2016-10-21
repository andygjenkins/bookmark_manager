require 'spec_helper'

feature 'User can sign in' do

  let(:user) do
    User.create(email: 'andy@gmail.com',
                password: '123',
                password_confirmation: '123')
  end

  scenario 'with correct email and password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome, #{user.email}")
  end

  scenario 'with incorrect email and password' do
     sign_in(email: user.email, password: "wrong")
     expect(page).to have_content("Email or password is incorrect")
   end


end
