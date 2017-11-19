class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  def new
    redirect_to home_path if logged_in?
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your account is successfully created."
      redirect_to home_path
    else
      render 'new'
    end
  end

  def balance
    render 'balance'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
