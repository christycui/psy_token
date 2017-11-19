class AddWelcomeOfferToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :welcome_offer, :boolean, default: 0
  end
end
