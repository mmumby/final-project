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
  name: 'John Doe',
  email: 'john@doe.com',
  password: '123456'
  })


# categories

cat1 = Category.find_or_create_by! name: 'Left overs'
cat2 = Category.find_or_create_by! name: 'Garden extras'
cat3 = Category.find_or_create_by! name: 'Wild produce'
cat4 = Category.find_or_create_by! name: 'Grocery store extras'
cat5 = Category.find_or_create_by! name: 'Other'

# posts

puts "Re-creating posts"

Post.destroy_all

cat1.posts.create!({
  title: "Veggies es bonus vobis",
  description: "Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.",
  image: "http://i.imgur.com/ToFylpO.jpg",
  user_id: 1
  })

cat1.posts.create!({
  title: "gumbo gourd",
  description: "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.",
  image: "http://i.imgur.com/Ay8s20X.jpg",
  user_id: 1
  })

cat1.posts.create!({
  title: "greens yarrow ricebean",
  description: "Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale.",
  image: "http://i.imgur.com/CW5GHuv.jpg",
  user_id: 1
  })

cat2.posts.create!({
  title: "Parsley shallot courgette",
  description: "Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.",
  image: "http://i.imgur.com/feYPs6R.jpg",
  user_id: 1
  })

cat2.posts.create!({
  title: "rutabaga endive",
  description: "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.",
  image: "http://i.imgur.com/Wy94Tt7.jpg",
  user_id: 1
  })

cat2.posts.create!({
  title: "icebean rutabaga",
  description: "Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale.",
  image: "http://i.imgur.com/jeJ3tYO.jpg",
  user_id: 1
  })

cat3.posts.create!({
  title: "essum magis kohlrabi",
  description: "Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.",
  image: "http://i.imgur.com/4KGVioH.jpg",
  user_id: 1
  })

cat3.posts.create!({
  title: "greens corn",
  description: "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.",
  image: "http://i.imgur.com/ZgjA8QQ.jpg",
  user_id: 1
  })

cat3.posts.create!({
  title: "cauliflower sea lettuce",
  description: "Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale.",
  image: "http://i.imgur.com/LU0r5dG.jpg",
  user_id: 1
  })


