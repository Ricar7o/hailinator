require "twitter"

Twitter.configure do |config|
  config.consumer_key = "o9QwqK8swZ2v5nuWikNfYA"
  config.consumer_secret = "8uws74UiOZrrqab6KeqV4aYbOoknL4TKVoAx3uApk"
  config.oauth_token = "1455072764-ejsvYUdDJKZc3S7xlgG29Mr44Tbs3HTzMHZE8jg"
  config.oauth_token_secret = "VIaB7USezEdEBbLIhzIDYJSvSCw2c4ziyEYS9r2Wxf4"
end

# hack to connect to twitter
Twitter.home_timeline
