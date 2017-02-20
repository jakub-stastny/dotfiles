#!/Users/botanicus/.rubies/ruby-2.4.0/bin/ruby

# TODO: TopTal can work the same.
# Payment status, new jobs etc.

require 'base64'
load File.expand_path('../../lib/bitbar.rb', __FILE__)

def messenger
  puts "| image=#{Base64.encode64(File.read('data/icons/messenger.png')).delete("\n")}", "---"
  run_and_print_output_or_fail('messenger')
end

begin
  unless run('messenger').empty?
    messenger
  else
    # Show nothing if the there are no unread messages.
  end
rescue CommandNotFound
  messenger
end
