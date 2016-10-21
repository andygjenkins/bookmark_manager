require 'spec_helper'

describe User do
  let(:user) do
    User.create(email: 'andy@gmail.com',
                password: '123',
                password_confirmation: '123')
    end

  it "authenticates a user when signing in" do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

end
