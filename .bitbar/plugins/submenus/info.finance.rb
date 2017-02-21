require 'json'
require 'open-uri'

# TODO: Authorise in FIO!

# https://www.fio.cz/docs/cz/API_Bankovnictvi.pdf
# https://www.fio.cz/ib2/wicket/page/NastaveniPage?4
title 'FIO'

from_date = to_date = Time.now.strftime('%Y-%m-%d')
# from_date = (Time.now - 1 * 24 * 60 * 50).strftime('%Y-%m-%d')

def rates(currency)
  @rates ||= Hash.new
  @rates[currency] ||= begin
    open("http://api.fixer.io/latest?base=#{currency}") do |stream|
      JSON.parse(stream.read)['rates']
    end
  end
end

# open("https://www.fio.cz/ib_api/rest/periods/#{config.fio_token}/#{from_date}/#{to_date}/transactions.json") do |stream|
#   p JSON.parse(stream.read)
  puts 'USD 5,624 | color=red'
  puts 'EUR 3,224 | color=green'
  puts 'CZK 121,177 | color=green'
  puts 'Total of USD $$$$ / EUR $$$$ / GBP $$$$.' # Convert all to USD.
  total = 9999 # USD
  # calculate monthly_spendings
  # puts "Runway: #{(total / monthly_spendings.to_f).round(2)} months."
# end

# TODO: Colours based on lows/highs.
usd_rates = rates(:USD)
eur_rates = rates(:EUR)
gbp_rates = rates(:GBP)

puts '---'
title 'Exchange rates'
puts "~ Add some caching first! Every 1 minute 3 requests, uff."
#puts "1 USD = #{usd_rates['CZK'].round(2)} CZK, #{usd_rates['EUR'].round(2)} EUR and #{usd_rates['GBP'].round(2)} GBP."
#puts "1 EUR = #{eur_rates['CZK'].round(2)} CZK, #{eur_rates['USD'].round(2)} USD and #{eur_rates['GBP'].round(2)} GBP."
#puts "1 GBP = #{gbp_rates['CZK'].round(2)} CZK, #{gbp_rates['USD'].round(2)} USD and #{gbp_rates['EUR'].round(2)} EUR."
