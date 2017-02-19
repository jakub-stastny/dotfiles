#!/usr/bin/env ruby

load File.expand_path('../../lib/bitbar.rb', __FILE__)

require 'json'

def command(identifier)
  %Q{bash=copy-to-clipboard param1=#{identifier} terminal=false}
end

data = JSON.parse(%x{copy-to-clipboard --list})

puts 'Copy to clipboard | color=green'
puts '---'
data.each do |identifier, label|
  puts "#{label} | #{command(identifier)}"
end
