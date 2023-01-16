require 'rails_helper'

describe User, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email) }
        it { should validate_presence_of(:password) }
        it { should validate_presence_of(:admin)}
    end

    it 'admin user exists' do
        data = { email: 'tanner@mail.com',
                 password: 'blahblah',
                 password_confirmation: 'blahblah',
                 admin: true
                }

        user = User.new(data)
        expect(user).to be_an_instance_of(User)
        expect(user.email).to eq('tanner@mail.com')
        expect(user).to have_attribute(:password_digest)
        expect(user).to have_attribute(:admin)
        expect(user.admin).to be true
    end

    it 'encrypts password' do
        user = User.create(email: 'tanner@mail.com', password: 'blahblah', password_confirmation: 'blahblah', admin: true)\

        expect(user).to_not have_attribute(:password)
        expect(user).to_not have_attribute(:password_confirmation)
        expect(user.password_digest).to_not eq('blahblah')
    end
end