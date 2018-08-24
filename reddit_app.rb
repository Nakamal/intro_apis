require 'http'
puts "Type in the subreddit you're looking for: "
sub_reddit = gets.chomp


response = HTTP.get("https://www.reddit.com/r/#{sub_reddit}.json")

if response.code != 200
  p "Learn to spell jackass!"
else
  response.parse

  posts = response.parse

  user_posts = posts["data"]["children"]

  user_posts.each do |child|
    p "#{child["data"]["title"]}"
  end
end




