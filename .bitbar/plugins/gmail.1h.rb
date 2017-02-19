#!/Users/botanicus/.rubies/ruby-2.4.0/bin/ruby

# TODO:
# Show always if there are pending confirmations.
# Group newsletters into a submenu and provide an unsubscribe link.
require 'base64'
load File.expand_path('../../lib/bitbar.rb', __FILE__)

def gmail
  puts "| image=#{Base64.encode64(File.read('data/icons/gmail.png')).delete("\n")}", "---"
  run_and_print_output_or_fail('gmail')
end

begin
  unless run('gmail').empty?
    gmail #if Time.now.monday? || Time.now.wednesday? || Time.now.friday? # or if confirmations.
    # TODO: --confirmations-only
  else
    # Show nothing if the there are no unread messages.
  end
rescue CommandNotFound
  gmail
end
