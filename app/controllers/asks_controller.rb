class AsksController < ApplicationController
  before_action :require_user

  def new
    if current_user.bids != []
      flash[:danger] = "You can either be a buyer or a seller in one auction. Please wait for the next auction."
      redirect_to root_path
    elsif current_user.asks != []
      flash[:danger] = "You can only submit one ask at a time. Please wait for the next auction."
      redirect_to root_path
    end
    @ask = Ask.new
  end

  def create
    @ask = Ask.new(params.require(:ask).permit(:ask_price))
    @ask.user = current_user
    if @ask.save
      flash[:success] = "You've submitted an ask to buy PSY."
      redirect_to root_path
    else
      render 'new'
    end
  end
end