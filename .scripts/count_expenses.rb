#!/usr/bin/env ruby

require 'csv'

data = CSV.parse(File.read(ARGV[0]), headers: true)
total = data.reduce(0) do |sum, row|
  raise "Error" unless row['Currency'] == 'USD'
  amount = row['Amount'].to_f
  amount > 0 ? sum : sum + amount
end

# Monthly expenses, without flat payments.
puts "Total spent: #{total} USD"
