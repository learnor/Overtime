
10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content")
end
puts '10 posts have been created.'
