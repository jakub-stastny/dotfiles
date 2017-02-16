#!/usr/bin/env ruby

Dir.chdir("/Users/botanicus/Dropbox/BitBar plugins")

puts "S"
Dir.glob("submenus/status.*").each do |script|
  puts "---"
  system script
end
