#!/usr/bin/env ruby

load File.expand_path('../../../lib/bitbar.rb', __FILE__)

require 'json'

CMD_NAME = 'copy-to-clipboard'

def command(identifier)
  # Either of these work, but only with terminal=true.
  %Q{bash='#{CMD_NAME} #{identifier}'}
  # %Q{bash=#{CMD_NAME} param1=#{identifier} terminal=false}
end

data = JSON.parse(%x{#{CMD_NAME} --list})

puts 'Copy to clipboard | color=green'
puts '---'
data.each do |identifier, label|
  puts "#{label} | #{command(identifier)}"
end
