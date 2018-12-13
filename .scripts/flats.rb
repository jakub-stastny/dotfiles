#!/usr/bin/env ruby

USD_RATE = 22.73

def convert(amount)
  (amount / USD_RATE).round(2)
end

rental_returns = [5700, 5000]

rental_returns.each.with_index do |rental_return, index|
  puts "Flat #{index + 1}: #{rental_return} CZK ($#{convert(rental_return)})"
end

total = rental_returns.reduce(:+)
puts "Total: #{total} CZK ($#{convert(total)})"
