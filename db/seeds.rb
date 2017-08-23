# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

puts "Finding or Creating Categories ..."

# users
puts "Re-creating user"
User.destroy_all

User.create!({
  name: 'Steven Seagal',
  email: 'john@doe.com',
  password: '123456',
  image: "https://i.ytimg.com/vi/8aIrVea9410/0.jpg"
  })


# categories

cat1 = Category.find_or_create_by! name: 'Left Overs'
cat2 = Category.find_or_create_by! name: 'Garden Extras'
cat3 = Category.find_or_create_by! name: 'Wild Produce'
cat4 = Category.find_or_create_by! name: 'Grocery Store Extras'
cat5 = Category.find_or_create_by! name: 'Food Bank'

# posts

puts "Re-creating posts"

Post.destroy_all

cat1.posts.create!({
  title: "Leftover Pizza",
  description: "3 pizzas that never got picked up. 1 Cheese, 1 Hawaiian, 1 Vegetarian. Get em' while they're still warm!",
  image: "http://i.imgur.com/ru9uyCd.jpg",
  user_id: 1,
  location: "Oreganos Fairfield",
  expiration: "2017-08-22"
  })

cat1.posts.create!({
  title: "Baked Potatoes",
  description: "2 dozen baked potatoes left over from the dinner rush.",
  image: "http://i.imgur.com/CzRqSa7.jpg",
  user_id: 1,
  location: "The Keg",
  expiration: "2017-08-22"
  })

cat2.posts.create!({
  title: "Plums Galore!",
  description: "Too many plums, too little time to eat them all! Help yourself! Eat em' fresh or make some delicious jam!",
  image: "http://i.imgur.com/0tjXtQt.jpg",
  user_id: 1,
  location: "145 wilson street, victoria",
  expiration: "2017-08-22"
  })

cat2.posts.create!({
  title: "Carrots, Beets, Onions & Potatoes",
  description: "Garden was good to us this year and as a result we have an abundance of veggies! All grown organically with love!",
  image: "http://4.bp.blogspot.com/--jn-tHZPU_E/TixaUD5zlTI/AAAAAAAAHwg/vCPhalBOkMc/s1600/rhubarbROASTveg+042.JPG",
  user_id: 1,
  location: "5147 Del Monte Ave",
  expiration: "2017-08-22"
  })

cat3.posts.create!({
  title: "Blackberry Bush",
  description: "Ginormous bush along the galloping goose. Blackberry season is here!!",
  image: "http://i.imgur.com/BkvjrXS.jpg",
  user_id: 1,
  location: "Goldstream Park",
  expiration: "2017-08-22"
  })

cat3.posts.create!({
  title: "Wild Apples",
  description: "Lots still left to pick with a lot on the ground too that could be used for cider! Enjoy!",
  image: "http://genuineaid.com/wp-content/uploads/crabapples-malus-crab-apples-wild-apples.jpg",
  user_id: 1,
  location: "Elk Lake",
  expiration: "2017-08-22"
  })

cat4.posts.create!({
  title: "Dozens of Eggs",
  description: "We can't sell them anymore but they're still good to eat! Would hate to see them all go to waste. Located around the back of the store. Thrifty Foods",
  image: "https://t3.ftcdn.net/jpg/00/96/08/02/240_F_96080213_O4lFaFwXmHxVMeehx43S4VAdoj7MGqpU.jpg",
  user_id: 1,
  location: "Thrifty Foods James Bay",
  expiration: "2017-08-22"
  })

cat4.posts.create!({
  title: "Assorted Baked Goods",
  description: "Big bag of day old bread, muffins, cookies, and croissants! Located around the back of the store @ Wildfire Bakery",
  image: "https://www.myfrugalhome.com/wp-content/uploads/2014/05/freebread590.jpg",
  user_id: 1,
  location: "Wildfire Bakery",
  expiration: "2017-08-22"
  })

cat5.posts.create!({
  title: "Canned Goods",
  description: "Pickles, beets, corn + assorted fruits & jams.",
  image: "https://media.mnn.com/assets/images/2015/08/canned-vegetables-pantry-shelf.jpg.838x0_q80.jpg",
  user_id: 1,
  location: "Mustard Seed",
  expiration: "2017-08-24"
  })

cat5.posts.create!({
  title: "Food Hampers",
  description: "Food hampers full of pasta, rice, canned goods, and treats.",
  image: "http://teachers.wrdsb.ca/eslresources/files/2015/04/food-bank.jpg",
  user_id: 1,
  location: "Rock Bay",
  expiration: "2017-08-24"
  })


