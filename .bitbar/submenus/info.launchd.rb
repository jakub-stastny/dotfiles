#!/usr/bin/env ruby

logs = Dir.glob('/tmp/botanicus.*.stderr').select do |path|
  (Time.now - (24 * 60 * 60)) < File.mtime(path)
end

unless logs.empty?
  puts 'Recent launchd error logs | color=blue'
  logs.each do |path|
    puts "#{File.basename(path)} | bash='cat #{path}'"
  end
end
