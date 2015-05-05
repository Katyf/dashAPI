class UsersController < ApplicationController

  before_filter :set_user, only: [:show,:update,:destroy]

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user, status: :ok
    else
      head :unauthorized
    end
  end

  def logout
    head :ok
  end

  def index
    @users = User.all
    render json: @users, :include => [:title, :skills]
  end

  def show
    render json: @user, :include => [:title, :skills]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :zipcode, :password, :password_confirmation, :token)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

