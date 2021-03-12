# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create!(name: "Example User",
              username: "username",
              email: "example@railstutorial.org",
              password: "foobar",
              password_confirmation: "foobar",
              created_at: Time.zone.now)
  99.times do |n|
    name = Faker::Name.name
    username = "username#{n+1}"
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                  username: username,
                  email: email,
                  password: password,
                  password_confirmation: password,
                  created_at: Time.zone.now)
  end

  # Tweets

users = User.order(:created_at).take(6)
50.times do
  tweet = Faker::Lorem.sentence(5)
  users.each { |user| user.tweets.create!(tweet: tweet)
}
end

# Create following relationships.
users = User.all
user = users.first
followees = users[2..50]
followers = users[3..40]
followees.each { |followee| user.follow(followee) }
followers.each { |follower| follower.follow(user) }