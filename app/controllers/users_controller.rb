class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  #before_filter :authenticate, only: [:index]

      def sign_in
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          render json: { token: user.token }
        else
          head :unauthorized
        end
      end

      def index
        # This is probably dangerous without a serializer as it will return sensitive information
        render json: User.all, status: :ok
      end

      def show
        # This is probably dangerous without a serializer as it will return sensitive information
        @user = User.find(params[:id])
        render json: @user
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: {token: @user.token}
        else
          render json: {message: 'failed', status: 500}
        end
      end

    private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :token)
      end

end
