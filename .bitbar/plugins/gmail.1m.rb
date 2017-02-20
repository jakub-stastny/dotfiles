#!/Users/botanicus/.rubies/ruby-2.4.0/bin/ruby

# TODO:
# Show always if there are pending confirmations.
# Group newsletters into a submenu and provide an unsubscribe link.
require 'base64'
load File.expand_path('../../lib/bitbar.rb', __FILE__)

puts "| image=#{Base64.encode64(File.read('data/icons/gmail.png')).delete("\n")}", "---"

def gmail
  puts read_cache('gmail')
  output = run_or_fail('gmail')
  p [:o, output]
  write_cache('gmail', output) # Refresh for the next run.
  File.open('/Users/botanicus/Desktop/gothere', 'w') { |f| f.puts 'x' }
rescue Errno::ENOENT
  puts 'Wait for the next round please.'
end

begin
  # unless run('gmail').empty?
    # if Time.now.monday? || Time.now.wednesday? || Time.now.friday? # or if confirmations.
    gmail
    # TODO: --confirmations-only
  # else
    # Show nothing if the there are no unread messages.
  # end
rescue CommandNotFound
  gmail
end
