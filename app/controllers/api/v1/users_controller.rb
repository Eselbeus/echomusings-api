class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    if (user_params[:key] == "427")
      @user = User.create(user_params)

      if @user.valid?
        @token = JWT.encode({user_id: @user.id}, 'secret')
        render json: { user: @user, jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:id, :name, :email, :password, :key)
  end
end
