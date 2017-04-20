require 'csv'
media_file = Rails.root.join('db', 'seeds.csv')

50.times do
  merchant_email = Faker::Name.last_name + "@betsy.com"
  username =   Faker::Color.color_name + "_" + Faker::Hipster.word
  Merchant.create!(merchant_name: Faker::Name.first_name, merchant_email: merchant_email, username: username )
end

CSV.foreach(media_file, headers: true, header_converters: :symbol, converters: :all) do |row|
  data = Hash[row.headers.zip(row.fields)]
  puts data
  Product.create!(data)
end
