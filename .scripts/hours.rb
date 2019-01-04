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
25/12: 06:01:20
26/12: 05:58:02
27/12: 04:44:46
28/12: 07:03:10
29/12: 0
30/12: 0
31/12: 0
1/1: 05:52:29
2/1: 12:44:17
3/1: 0
4/1: 0
5/1: 0
6/1: 0
7/1: 0
