class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :edit, :update]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to action: 'index'
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to action: 'index'
  end

  def destroy
    @user.destroy
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
