#!/usr/bin/env ruby

URLs = ['http://botanicus.me', 'http://www.rubyinside.com/nethttp-cheat-sheet-2940.html']

require 'uri'
require 'net/http'

puts "Website status"
puts "---"
URLs.each do |url|
  begin
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    if response.code.match(/20\d/)
      puts "✔︎ #{url} | color=green"
    else
      puts "✘ #{url} (HTTP #{response.code}) | color=red"
    end
  rescue Errno::ECONNREFUSED
    puts "✘ #{url} (server down) | color=red"
  rescue SocketError
    puts "Internet is down | color=grey"
  end
end
