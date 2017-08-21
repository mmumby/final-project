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
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end

puts "Finding or Creating Categories ..."

# users
puts "Re-creating user"
User.destroy_all

User.create!({
  name: 'John Doe',
  email: 'john@doe.com',
  password: '123456'
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
  image: "http://i.imgur.com/ToFylpO.jpg",
  user_id: 1,
  location: "Oreganos Fairfield"
  })

cat1.posts.create!({
  title: "Baked Potatoes",
  description: "2 dozen baked potatoes left over from the dinner rush.",
  image: "http://i.imgur.com/Ay8s20X.jpg",
  user_id: 1,
  location: "The Keg"
  })

cat2.posts.create!({
  title: "Plums Galore!",
  description: "Too many plums, too little time to eat them all! Help yourself! Eat em' fresh or make some delicious jam!",
  image: "http://i.imgur.com/CW5GHuv.jpg",
  user_id: 1,
  location: "145 wilson street, victoria"
  })

cat2.posts.create!({
  title: "Carrots, Beets & Potatoes",
  description: "Garden was good to us this year and as a result we have an abundance of veggies! All grown organically with love!",
  image: "http://i.imgur.com/feYPs6R.jpg",
  user_id: 1,
  location: "5147 Del Monte Ave"
  })

cat3.posts.create!({
  title: "Blackberry Bush",
  description: "Ginormous bush along the galloping goose. Blackberry season is here!!",
  image: "http://i.imgur.com/Wy94Tt7.jpg",
  user_id: 1,
  location: "clover point park"
  })

cat3.posts.create!({
  title: "Wild Apples",
  description: "Lots still left to pick with a lot on the ground too that could be used for cider! Enjoy!",
  image: "http://i.imgur.com/jeJ3tYO.jpg",
  user_id: 1,
  location: "Elk Lake"
  })

cat4.posts.create!({
  title: "Dozens of Eggs",
  description: "We can't sell them anymore but they're still good to eat! Would hate to see them all go to waste. Located around the back of the store. Thrifty Foods",
  image: "http://i.imgur.com/4KGVioH.jpg",
  user_id: 1,
  location: "Thrifty Foods James Bay"
  })

cat4.posts.create!({
  title: "Assorted Baked Goods",
  description: "Big bag of day old bread, muffins, cookies, and croissants! Located around the back of the store @ Wildfire Bakery",
  image: "http://i.imgur.com/ZgjA8QQ.jpg",
  user_id: 1,
  location: "Wildfire Bakery"
  })

cat5.posts.create!({
  title: "Canned Goods",
  description: "Large variety of canned goods. Beans, soups, vegetables, and tuna. Feel free to stop by, we're open Monday to Friday from 9 - 5 @ The Mustard Seed",
  image: "http://i.imgur.com/LU0r5dG.jpg",
  user_id: 1,
  location: "Mustard Seed"
  })

cat5.posts.create!({
  title: "Food Hampers",
  description: "Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale.",
  image: "http://i.imgur.com/LU0r5dG.jpg",
  user_id: 1,
  location: "rock bay, victoria"
  })


