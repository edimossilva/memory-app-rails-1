class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to action: 'index'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:name, :phone)
    end
end
