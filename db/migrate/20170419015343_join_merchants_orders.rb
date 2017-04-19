class JoinMerchantsOrders < ActiveRecord::Migration[5.0]
  def change
    create_join_table :merchants, :orders do |t|
      t.index :merchant_id
      t.index :order_id
    end
  end
end
