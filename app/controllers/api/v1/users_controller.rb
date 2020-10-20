class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = JWT.encode({user_id: @user.id}, 'secret')
      render json: { user: User.new(@user), jwt: @token }, status: :created
    else
      render json: { error: @user.errors }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:id, :name, :email, :password, :key)
  end
end
