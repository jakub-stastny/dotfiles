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
Tue 16/10: 0:00:00
Wed 17/10: 3:53:56
Thu 18/10: 1:51:53
Fri 19/10: 3:26:51
Sat 20/10: 8:45:18
Sun 21/10: 3:49:05
Mon 22/10: 13:27:01
