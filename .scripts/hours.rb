#!/usr/bin/env ruby

$LOAD_PATH.unshift('/root/hour-ruby/lib')

require 'yaml'
require 'hour'

# This is interesting, YAML parses 0:15 as 900.
timesheet = YAML.load(DATA.read)
timesheet.each do |date, seconds|
  puts "#{date} #{Hour.from(seconds: seconds)} – #{Hour.from(seconds: seconds).to_decimal}"
end

__END__
12/10: 4:16:47
11/10: 8:27:04
10/10: 7:49:11
9/10:  4:18:25
