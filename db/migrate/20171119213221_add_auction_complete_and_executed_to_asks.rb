class AddAuctionCompleteAndExecutedToAsks < ActiveRecord::Migration[5.1]
  def change
    add_column :asks, :auction_complete, :boolean, default: 0
    add_column :asks, :executed, :boolean, default: 0
  end
end
