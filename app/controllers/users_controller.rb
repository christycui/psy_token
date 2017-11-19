class UsersController < ApplicationController
  before_action :require_user, only: [:redeem, :redeemed, :balance]
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

  def redeem
    @user = User.find_by(slug: params[:slug])
    if @user.welcome_offer?
      flash[:danger] = "You have already redeemed the welcome offer."
      redirect_to home_path
    end
  end

  def redeemed
    @user = User.find_by(slug: params[:slug])
    if @user.welcome_offer?
      flash[:danger] = "You have already redeemed the welcome offer."
    else
      @user.balance += 1
      @user.welcome_offer = true
      @user.save
      flash[:success] = "You have redeeemed 1 PSY token"
    end
    redirect_to home_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
