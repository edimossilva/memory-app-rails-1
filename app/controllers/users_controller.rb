class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to action: 'index'
  end

  private
    def user_params
      params.permit(:name, :phone)
    end
end
