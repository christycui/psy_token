class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.decimal :bid_price, :precision => 10, :scale => 2
      t.boolean :auction_complete, :executed, :default => 0
      t.timestamps
    end
  end
end
