# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.create(username:"111", email: "1@1", password: "111111", encrypted_password: "111111")
#Post.create(title: "안녕하세요", content: "반갑습니다.", user_id: 1)
(1..3).each do |i|
    User.create(username: i , email: "#{i}@#{i}.com" , password: "121212" , password_confirmation: "121212")
    (1..3).each do |j|
        Post.create(title: "#{i}가 #{j}번째 글씀" , content: "#{i}가 쓴#{j}번째 글임", user_id: i)
    end
end