class AddDefaultToMerchantName < ActiveRecord::Migration[5.0]
  def change
    change_column_default :merchants, :merchant_name, :username
  end
end
