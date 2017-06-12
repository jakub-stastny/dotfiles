#!/Users/botanicus/.scripts/ruby

load File.expand_path('../../lib/bitbar.rb', __FILE__)
require 'date'

today = Date.parse(ENV['DATE']) rescue Date.today

if today.day == 1
  puts 'W | color=green', '---'
  puts run_or_fail('wishlist')
elsif today.saturday?
  begin
    unless run('research_queue').empty?
      puts 'RQ | color=green', '---'
      puts run_or_fail('research_queue')
    else
      # Show nothing if the research queue is empty.
    end
  rescue CommandNotFound
    puts 'RQ | color=green', '---'
    puts run_or_fail('research_queue')
  end
end
