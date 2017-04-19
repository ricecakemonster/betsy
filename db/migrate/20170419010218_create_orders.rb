class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :cc_num
      t.string :cc_name
      t.string :order_email
      t.string :mailing_address
      t.string :cc_expiry
    end
  end
end
