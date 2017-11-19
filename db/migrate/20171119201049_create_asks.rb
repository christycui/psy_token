class CreateAsks < ActiveRecord::Migration[5.1]
  def change
    create_table :asks do |t|
      t.integer :user_id
      t.decimal :ask_price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
