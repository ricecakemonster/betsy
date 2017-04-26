require 'csv'
media_file = Rails.root.join('db', 'seeds.csv')

50.times do |i|
  username = "merchant_#{i}"
  merchant_email = "#{merchant}@betsy.com"
  Merchant.create!(merchant_name: username, merchant_email: merchant_email)
end


CSV.foreach(media_file, headers: true, header_converters: :symbol, converters: :all) do |row|
  data = Hash[row.headers.zip(row.fields)]
  puts data
  Product.create!(data)
end
