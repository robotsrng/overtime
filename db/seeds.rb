# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{id: 100, email: "a@a", username: "a", first_name: 'Shane', last_name: 'Ryan', password: 'asdfasdf', password_confirmation: 'asdfasdf'}])
puts User.all.count.to_s + "Users Created"

10.times do |post|
  Post.create!([{date: Date.today, rationale: "#{post} Content", user: User.last}])
end
puts Post.all.count.to_s + "Posts Created"
