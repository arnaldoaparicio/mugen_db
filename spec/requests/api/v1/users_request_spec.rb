require 'rails_helper'

RSpec.describe 'User API' do
  it 'creates a new user' do
    user_params = { email: 'jake@mail.com',
                    password: 'blahblah',
                    password_confirmation: 'blahblah',
                    admin: true }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
    expect(response.status).to eq(201)
  end

  it 'logins to existing account' do
    user = User.create(email: 'jake@mail.com',
                       password: 'blahblah',
                       password_confirmation: 'blahblah',
                       admin: true)
    user_params = {
      email: 'jake@mail.com',
      password: 'blahblah'
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/login', headers: headers, params: JSON.generate(user: user_params)

    expect(response.status).to eq(200)
  end

  it 'fails to login with wrong password' do
    user = User.create(email: 'jake@mail.com',
                       password: 'blahblah',
                       password_confirmation: 'blahblah',
                       admin: true)
    user_params = {
      email: 'jake@mail.com',
      password: 'blah'
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/login', headers: headers, params: JSON.generate(user: user_params)

    expect(response.status).to eq(400)
  end

  it 'fails to login with email' do
    user = User.create(email: 'jake@mail.com',
                       password: 'blahblah',
                       password_confirmation: 'blahblah',
                       admin: true)
    user_params = {
      email: 'ryan@mail.com',
      password: 'blahblah'
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/login', headers: headers, params: JSON.generate(user: user_params)
    
    expect(response.status).to eq(400)
  end
end
