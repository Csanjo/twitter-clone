# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

p "Destroying data..."

Following.destroy_all
Tweet.destroy_all
User.destroy_all

p "Creating Users"

User.create!(username: "coolcv", email: "christian@me.com", password: "123123")

10.times do
  name = Faker::Twitter.screen_name
  User.create!(username: name, email: "#{name}@mail.com", password: "123123")
end

p "Creating Tweets"

20.times do
  Tweet.create!(user: User.all[rand(0..10)], description: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4))
end

p "Creating Followings"

80.times do
  Following.create!(followee: User.all[rand(0..10)], follower: User.all[rand(0..10)])
end
p "Finished"
