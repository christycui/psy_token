class BidsController < ApplicationController
  before_action :require_user

  def new
    if current_user.balance < 1
      flash[:danger] = "You don't have any tokens to sell yet. Go to Redeem tab to get 1 token."
      redirect_to root_path
    elsif current_user.asks != []
      flash[:danger] = "You can either be a buyer or a seller in one auction. Please wait for the next auction."
      redirect_to root_path
    elsif current_user.bids != []
      flash[:danger] = "You can only submit one bid at a time. Please wait for the next auction."
      redirect_to root_path
    end
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(params.require(:bid).permit(:bid_price))
    @bid.user = current_user
    if @bid.save
      flash[:success] = "You've submitted an bid to sell PSY."
      redirect_to root_path
    else
      render 'new'
    end
  end
end