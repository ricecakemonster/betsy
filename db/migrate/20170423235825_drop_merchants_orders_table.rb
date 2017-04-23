class DropMerchantsOrdersTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :merchants_orders
  end
end
