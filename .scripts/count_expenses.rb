#!/usr/bin/env ruby

require 'csv'

data = CSV.parse(File.read(ARGV[0]), headers: true)
total = data.reduce(0) do |sum, row|
  raise "Error" unless row['Currency'] == 'USD'
  sum + row['Amount'].to_f
end

# Monthly expenses, without flat payments.
puts "Total spent: #{total} USD"
