
10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content")
end
puts '10 posts have been created.'

User.create!(email: 'test@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'Jon', last_name: 'Snowy')

puts 'user test@test.com created.'
