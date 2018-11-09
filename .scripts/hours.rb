#!/usr/bin/env ruby

$LOAD_PATH.unshift('/root/hour-ruby/lib')

require 'yaml'
require 'hour'

RATE = 50

# This is interesting, YAML parses 0:15 as 900.
timesheet = YAML.load(DATA.read)
hours = timesheet.map do |date, seconds|
  hour_period = Hour.from(seconds: seconds)
  puts "#{date} #{hour_period} – #{hour_period.to_decimal} = $#{(hour_period.to_decimal * RATE).round}"
  hour_period
end

total = hours.reduce(:+)

puts "\n#{total} * #{RATE} = $#{(total.to_decimal * RATE).round}"

__END__
Tue 30/10: 12:45:24
Fri 2/11: 2:52:02
Mon 5/11: 11:28:00
Tue 6/11: 7:21:17
Wed 7/11: 00:34:09
Thu 8/11: 4:32:27
