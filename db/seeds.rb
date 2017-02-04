@user = User.create!(email: 'test@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'Jon', last_name: 'Snowy')

puts '1 user test@test.com has been created.'

AdminUser.create!(email: 'admin@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'Admin', last_name: 'User') 

puts '1 admin user test@test.com has been created.'

10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id )
end
puts '10 posts have been created.'
