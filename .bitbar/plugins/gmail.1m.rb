#!/Users/botanicus/.rubies/ruby-2.4.1/bin/ruby

load File.expand_path('../../lib/bitbar.rb', __FILE__)

command = read_command('gmail_by_time')
command.bitbar("| image=#{encode_icon('data/icons/gmail.png')}")
