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
Tue 30/10: 0:00:00
