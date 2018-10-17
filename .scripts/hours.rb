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
