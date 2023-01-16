class Api::V1::UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            render json: UserSerializer.new(user), status: 201
        else
            render status: 400
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :admin)
    end

end