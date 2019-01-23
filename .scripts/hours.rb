#!/usr/bin/env ruby

$LOAD_PATH.unshift('/root/hour-ruby/lib')

require 'yaml'
require 'hour'

# Fixme: rate varies.
RATE = 50

# This is interesting, YAML parses 0:15 as 900.
timesheets = YAML.load(DATA.read)

timesheets.each do |company, timesheet|
  puts "# #{company} #"
  hours = timesheet.map do |date, seconds|
    hour_period = Hour.from(seconds: seconds || 0)
    puts "  #{date} #{hour_period} – #{hour_period.to_decimal} = $#{(hour_period.to_decimal * RATE).round}"
    hour_period
  end

  total = hours.reduce(:+)

  puts "\n  #{total} * #{RATE} = $#{(total.to_decimal * RATE).round}"
end

__END__
supervillains:
  22/1:
  23/1:
  24/1:
  25/1:
  26/1:
  27/1:
  28/1:
  29/1:
  30/1:
  31/1:
  1/2:
  2/2:
  3/2:
  4/2:
