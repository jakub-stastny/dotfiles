#!/Users/botanicus/.rubies/ruby-2.4.0/bin/ruby

load File.expand_path('../lib/bitbar.rb', __FILE__)

puts '£ | color=blue', '---'

Dir.glob('submenus/info.*').map do |script|
  submenu(cache_command(script)) #rescue Skip
end
