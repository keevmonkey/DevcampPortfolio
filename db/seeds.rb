# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
  Topic.create!(title: "Topic: #{topic}")
end
puts "=== 3 Topics created ==="

10.times do |blog|
  Blog.create!(
    title: "This is a post about #{Faker::Games::Fallout.unique.character}",
    body: Faker::Games::Fallout.quote,
    topic_id: Topic.last.id
  )
end
puts "=== 10 Blog posts created ==="

9.times do |portfolio_items|
  Portfolio.create!(
    title: Faker::Games::Witcher.unique.character,
    subtitle: Faker::Games::Witcher.location,
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/300x250"
  )
end
puts "=== 9 Portfolio items created ==="

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end
puts "=== 3 Technologies created for last portfolio item ==="

5.times do |skills|
  Skill.create!(
    title: Faker::Games::Fallout.faction,
    percent_utilized: rand(1..100)
  )
end
puts "=== 5 skills created ==="