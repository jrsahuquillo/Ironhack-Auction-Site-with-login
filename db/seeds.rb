# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 1.upto(10).each do |i|
#   user = User.create!(name: "name#{i}", email: " email#{i}@mailg.com")
#   user.product_entries.create("Product#{i}")
# end

# User.create!(name: "Sahu", email: "jrsahuquillo@gmail.com")
# User.create!(name: "John", email: "john@gmail.com")
# User.create!(name: "Ann", email: "annholt@gmail.com")
# User.create!(name: "Mary", email: "maryjackson@gmail.com")


1.upto(10).each do |i|
  user = User.create!(name: "User#{i}", email: "user#{i}@gmail.com", password: '12345678')
  user.products.create(title: "Product#{i}", description: "Product description #{i}", deadline: DateTime.now + i.day)
end

# 1.upto(10).each do |i|
#   user = User.create!(name: "User#{i}", email: "user#{i}@gmail.com")
#   user.products.create(title: "Product#{i}", description: "Product description #{i}", deadline: DateTime.now + i.day)
#   user.products.bids.create(amount: rand(1..20)
# end
