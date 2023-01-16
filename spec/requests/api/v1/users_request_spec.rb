require 'rails_helper'

RSpec.describe 'User API' do
    it 'creates a new user' do
        user_params = { email: 'jake@mail.com',
                        password: 'blahblah',
                        password_confirmation: 'blahblah',
                        admin: true 
                      }
        headers = { 'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

        expect(response.status).to eq(201)
    end
end