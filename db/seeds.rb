require 'csv'
media_file = Rails.root.join('db', 'seeds.csv')

50.times do |i|
  username = "merchant_#{i}"
  merchant_email = "#{username}@betsy.com"
  oauth_uid = rand.to_s[2..11].to_i
  oauth_provider = "github"
  Merchant.create!(merchant_name: username ,merchant_email: merchant_email, username: username, oauth_uid: oauth_uid, oauth_provider: oauth_provider)
end


CSV.foreach(media_file, headers: true, header_converters: :symbol, converters: :all) do |row|
  data = Hash[row.headers.zip(row.fields)]
  puts data
  Product.create!(data)
end
