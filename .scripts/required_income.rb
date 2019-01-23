#!/usr/bin/env ruby

# Workday: work (w) hours.
# Saturday: work (s) hours.
#
# Holidays: 1 full week of every month.
# Work (h) hours.
#
# Target
# - CZK 660k (property) = USD 29k
# - USD 5k (basics)
# - USD 2k (extra, i. e. insurance and tools).
# = USD 36k

require 'date'

today = Date.today
quarter = (today.month / 4) + 1
quarter_start_month = (quarter * 3) - 2
quarter_end_month = quarter * 3

quarter_start_date = Date.new(today.year, quarter_start_month, 1)
quarter_end_date = Date.new(today.year, quarter_end_month + 1, 1).prev_day

days_this_quarter = (quarter_start_date..quarter_end_date)

required_income = 36_000
schedule = {workday: 7, saturday: 4, holidays: 2}

hours_per_quarter = days_this_quarter.reduce(0) do |hours, date|
  if date.sunday?
    hours
  elsif (1..7).include?(date.day)
    hours + schedule[:holidays]
  elsif date.saturday?
    hours + schedule[:saturday]
  else
    hours + schedule[:workday]
  end
end

puts "You need to bill #{required_income / hours_per_quarter} per hour."
