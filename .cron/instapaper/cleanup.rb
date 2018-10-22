#!/usr/bin/env ruby

client = Instapaper::Client.new do |client|
  client.consumer_key = YOUR_CONSUMER_KEY
  client.consumer_secret = YOUR_CONSUMER_SECRET
  client.oauth_token = YOUR_OAUTH_TOKEN
  client.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end
