require 'csv'
media_file = Rails.root.join('db', 'seeds.csv')

50.times do
  merchant_email = Faker::Name.last_name + Faker::Number.number(2) + "@betsy.com"
  username = Faker::Color.color_name + "_" + Faker::Hipster.word
  oauth_uid = Faker::Number.number(5)
  oauth_provider = "github"
  Merchant.create!(merchant_name: Faker::Name.first_name, merchant_email: merchant_email, username: username, oauth_uid: oauth_uid, oauth_provider: oauth_provider)
end

CSV.foreach(media_file, headers: true, header_converters: :symbol, converters: :all, skip_blanks: true) do |row|
  data = Hash[row.headers.zip(row.fields)]
  if data[:image_url].nil?
    data.delete(:image_url)
  puts data
  Product.create!(data)
end
