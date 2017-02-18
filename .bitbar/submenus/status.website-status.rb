URLs = ['http://botanicus.me', 'http://www.rubyinside.com/nethttp-cheat-sheet-2940.html']

require 'uri'
require 'net/http'

title 'Website status'

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
  end
end
