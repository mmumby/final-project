# Lettuce Share

Lettuce share is a community network centered around minimizing food waste.

App built using:
* Ruby on Rails for the back and frontend.
* Websockets, Javascript, and jQuery for instant messaging between users.
* Bootstrap and SASS for styling.


**App deployed on Heroku Visit: lettuceshare.ca**

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `rails db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Run `rails s` to start the server

## Dependencies

* Rails 5.0.5
* PostgreSQL 9.x
