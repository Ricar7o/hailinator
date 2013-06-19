require "twitter"
require "csv"

# Follow the quick-start guide to get that going:
# https://github.com/sferik/twitter#quick-start-guide
Twitter.configure do |config|
  config.consumer_key = "o9QwqK8swZ2v5nuWikNfYA"
  config.consumer_secret = "8uws74UiOZrrqab6KeqV4aYbOoknL4TKVoAx3uApk"
  config.oauth_token = "1455072764-ejsvYUdDJKZc3S7xlgG29Mr44Tbs3HTzMHZE8jg"
  config.oauth_token_secret = "VIaB7USezEdEBbLIhzIDYJSvSCw2c4ziyEYS9r2Wxf4"
end

# hack to connect to twitter
Twitter.home_timeline

# do hashtag search
CSV.open("tweets.csv", "wb") do |csv|
	csv << ['handle','text', "url"]
	tweets = Twitter.search("#hail #damage").results.map do |status|
		puts status.methods
		# puts status.inspect
		csv << [status.from_user, status.text, ]
	end
end
