#!/usr/bin/env ruby

require 'json'

CMD_PATH = '/Users/botanicus/.scripts/copy-to-clipboard'

def command(identifier)
  %Q{bash=#{CMD_PATH} param1=#{identifier} terminal=false}
end

data = JSON.parse(%x{#{CMD_PATH} --list})

puts 'Copy to clipboard'
puts '---'
data.each do |identifier, label|
  puts "#{label} | #{command(identifier)}"
end
