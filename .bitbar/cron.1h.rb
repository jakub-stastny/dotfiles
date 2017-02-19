#!/Users/botanicus/.rubies/ruby-2.4.0/bin/ruby

load File.expand_path('../lib/bitbar.rb', __FILE__)

if Time.now.day == 1
  puts 'W | color=green', '---'
  puts %x{wishlist}
elsif Time.now.saturday? && ! (research_queue = %x{research_queue}).empty?
  puts 'RQ | color=green', '---'
  puts research_queue
end
