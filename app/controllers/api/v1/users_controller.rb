class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render status: 400
    end
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user), status: 200
  end

  def login
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: { data: { id: 'Login failed', attributes: { email: 'Login failed', admin: 'Login failed'} } }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
