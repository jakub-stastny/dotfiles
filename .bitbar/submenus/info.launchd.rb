#!/usr/bin/env ruby

logs = Dir.glob('/tmp/botanicus.*.stderr') + Dir.glob('/tmp/*.log')
logs = logs.select do |path|
  (Time.now - (24 * 60 * 60)) < File.mtime(path)
end

unless logs.empty?
  puts 'Recent error logs | color=blue'
  logs.each do |path|
    puts "#{File.basename(path)} | bash='cat \"#{path}\"'"
  end
end
