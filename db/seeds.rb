
require 'faker'
iphone_categories = ['iPhone','iPhone 3G','iPhone 3GS','iPhone 4','iPhone 4S',
  'iPhone 5','iPhone 5C','iPhone 5S','iPhone 6 / 6 Plus','iPhone 6S / 6S Plus',
  'iPhone SE','iPhone 7 / 7 Plus','iPhone 8 / 8 Plus','iPhone X' ]
PHOTOS = {
  'iPhone'=> 'iphone_geral.jpeg',
  'iPhone 3G' => 'iphone3g.jpeg',
  'iPhone 3GS' => 'iphone3gs.jpeg',
  'iPhone 4' => 'iphone4.png',
  'iPhone 4S' => 'iphone4s.jpeg',
  'iPhone 5' => 'iphone5.jpg',
  'iPhone 5C' => 'iphone5c.png',
  'iPhone 5S' => 'iphone5s.jpeg',
  'iPhone 6 / 6 Plus' => 'iphone6.jpeg',
  'iPhone 6S / 6S Plus' => 'iphone6s.jpeg',
  'iPhone SE' => 'iphonese.jpeg',
  'iPhone 7 / 7 Plus' => 'iphone7.jpeg',
  'iPhone 8 / 8 Plus' => 'iphone8.jpeg',
  'iPhone X' => 'iphonex.jpeg'
}

puts 'creating users'
counter_user = 0
users_array = []
20.times do
  counter_user += 1
  a_user = User.new
  a_user.first_name = Faker::Name.first_name
  a_user.last_name = Faker::Name.last_name
  a_user.email = Faker::Internet.safe_email(a_user.first_name)
  a_user.password = '123123'
  a_user.save
  users_array << a_user
  puts "User #{a_user.first_name} created with email: #{a_user.email}\nTotal users created:#{counter_user}"
end
puts 'Creating Random products'
products_array = []
counter_product = 0
rand(30..40).times do
  counter_product += 1
  a_product = Product.new
  a_product.price = rand(101..999)
  a_product.color = Faker::Color.color_name
  a_product.description = Faker::Hacker.say_something_smart
  a_product.owner = users_array.sample
  a_product.model_code = Faker::Code.isbn
  a_product.product_type = %w[Phones Laptops Tablets iPods Acessories].sample
  a_product.category = iphone_categories.sample
  a_product.version = Faker::Code.asin
  a_product.owner = users_array.sample
  a_product.photo = PHOTOS[a_product.category]
  a_product.save
  products_array << a_product
  puts "Product #{a_product.category} created\nTotal products created:#{counter_product}"
end
puts 'Creating random questions for random products'
products_array.each do |product|
  counter_questions = 0
  a_product = product
  rand(2..4).times do
    counter_questions += 1
    a_question = Question.new
    a_question.question_description = "#{Faker::Simpsons.quote}?"
    a_question.asker = users_array.sample
    a_question.product = a_product
    a_question.save
    puts "Question created for Product Id: #{a_product.id}\n Total questions created for this product:#{counter_questions}"
  end
end
puts 'Almost done'
puts 'Creating internal users'
oscar = User.new(first_name:'oscar',email:'oscar@teste.com',password:'123123')
oscar.save
thiago = User.new(first_name:'thiago',email:'thiago@teste.com',password:'123123')
thiago.save
andre = User.new(first_name:'andre',email:'andre@teste.com',password:'123123')
andre.save
Product.all[0].owner = oscar
Product.all[0].update(owner: oscar)
Product.all[1].owner = thiago
Product.all[1].update(owner: thiago)
Product.all[2].owner = andre
Product.all[2].update(owner: andre)
puts 'All tasks completed'
puts '*************************************'
puts 'Questions finalized'
puts '*************************************'
puts '*************************************'
puts 'SUMMARY'
puts '*************************************'
puts "Total Products: #{Product.count}"
puts "Total Users: #{User.count}"
puts "Total Questions: #{Question.count}"
