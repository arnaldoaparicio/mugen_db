class User < ApplicationRecord
    validates :email, uniqueness: true, presence: true
    validates_presence_of :password
    validates_presence_of :admin

    has_secure_password
end