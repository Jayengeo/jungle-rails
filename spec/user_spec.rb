require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'Validations' do
    it "User is valid" do
      user = User.new(
        first_name: 'Jacky',
        last_name: 'Ngo',
        email: 'jacky@ngo.com',
        password: '12345',
        password_confirmation: '12345'
      )
      expect(user).to be_valid
    end
  end 
  
  it "password does not match" do
    user = User.new(
        first_name: 'Jacky',
        last_name: 'Ngo',
        email: 'jacky@ngo.com',
        password: '12345',
        password_confirmation: '12346'
      )
    user.valid?
    expect(user.errors[:password_confirmation]).to be_present
  end
  
  it 'email must be unique' do
    user = User.new
    user.first_name = 'Jacky'
    user.last_name = 'Ngo'
    user.email = 'jacky@ngo.com'
    user.password = '12345'
    user.password_confirmation = '12345'

    user.save
  
    user1 = User.new
    user1.first_name = 'Jacky'
    user1.last_name = 'Ngo'
    user1.email = 'jacky@ngo.com'
    user1.password = '12345'
    user1.password_confirmation = '12345'
    user1.save
  
    expect(user1.errors[:email].first).to eq('has already been taken')
  end
  
  it "email is missing" do
    user = User.new(email: nil)
    expect(user).to be_invalid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "first name is missing" do
    user = User.new(first_name: nil)
    expect(user).to be_invalid
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "last name is missing" do
    user = User.new(last_name: nil)
    expect(user).to be_invalid
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it 'password length less than 5 characters is invalid' do
    user = User.new
    user.first_name = 'Jacky'
    user.last_name = 'Ngo'
    user.email = 'jacky@ngo.com'
    user.password = '1234'
    user.password_confirmation = '1234'
    expect(user).to be_invalid
  end

describe '.authenticate_with_credentials' do
  it 'should pass with valid credentials' do
    user = User.new(
      first_name: 'Jacky',
      last_name: 'Ngo',
      email: 'jacky@ngo.com',
      password: '12345',
      password_confirmation: '12345'
    )
    user.save

    user = User.authenticate_with_credentials('jacky@ngo.com', '12345')
    expect(user).not_to be(nil)
  end

  it 'should not pass with invalid credentials' do
    user = User.new(
      first_name: 'Jacky',
      last_name: 'Ngo',
      email: 'jacky@ngo.com',
      password: '12345',
      password_confirmation: '12345'
    )
    user.save

    user = User.authenticate_with_credentials('jacky@ngo.com', '45678')
    expect(user).to be(nil)
  end

  it 'should pass even with spaces present in email' do
    user = User.new(
      first_name: 'Jacky',
      last_name: 'Ngo',
      email: 'jacky@ngo.com',
      password: '12345',
      password_confirmation: '12345'
    )
    user.save

    user = User.authenticate_with_credentials('  jacky@ngo.com ', '12345')
    expect(user).not_to be(nil)
  end

  it 'should pass even with caps present in email' do
    user = User.new(
      first_name: 'Jacky',
      last_name: 'Ngo',
      email: 'jacky@ngo.com',
      password: '12345',
      password_confirmation: '12345'
    )
    user.save

    user = User.authenticate_with_credentials('Jacky@Ngo.com', '12345')
    expect(user).not_to be(nil)
  end
end
end