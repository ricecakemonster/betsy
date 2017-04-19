class JoinOrdersProducts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :orders, :products do |t|
      t.index :order_id
      t.index :product_id
    end
  end
end
