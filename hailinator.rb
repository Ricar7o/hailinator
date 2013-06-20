require "twitter"
require "csv"
require "koala"

# Follow the quick-start guide to get that going:
# https://github.com/sferik/twitter#quick-start-guide
Twitter.configure do |config|
  config.consumer_key = "o9QwqK8swZ2v5nuWikNfYA"
  config.consumer_secret = "8uws74UiOZrrqab6KeqV4aYbOoknL4TKVoAx3uApk"
  config.oauth_token = "1455072764-ZvJZKhySbo1xEjJ0jSyXkvlYk8w84HTA30v7Jtm"
  config.oauth_token_secret = "SNrnJrw0FdvMlSduUfF6QOcGScDdmoeZAq9k2UpsdE"
end

@graph = Koala::Facebook::API.new("100005957380999")
puts @graph.inspect
puts @graph.class

# query = "SELECT name FROM user WHERE uid = me()"
# puts @graph.fql_query(query)


# hack to connect to twitter
Twitter.home_timeline

# do hashtag search
CSV.open("tweets.csv", "wb") do |csv|
	csv << ['handle','text', "url"]
	tweets = Twitter.search("#hail #damage").results.map do |status|
		# status.action.favorite
		# puts status.inspect
		# puts
		puts status.methods.sort
		# puts
		# Twitter.favorite(status.id) # <--- This code favorites a Tweet. It takes the ID of the Tweet as the argument
		# Twitter.follow(status.from_user) # <--- This code follows a Twitter user. It takes the username of the Twitter as the argument
		csv << [status.from_user, status.text, "https://twitter.com/#{status.from_user}/statuses/#{status.id}"]
	end
end

