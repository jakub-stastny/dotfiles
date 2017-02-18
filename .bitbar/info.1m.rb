#!/usr/bin/env ruby

Dir.chdir('/Users/botanicus/.bitbar')

puts 'i | color=blue'

output = Dir.glob('submenus/info.*').map do |script|
  ['---', %x{#{script}}].join("\n")
end.join("\n")

puts output
