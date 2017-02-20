#!/Users/botanicus/.rubies/ruby-2.4.0/bin/ruby

load File.expand_path('../../lib/bitbar.rb', __FILE__)

command = read_command('messenger')
command.bitbar("| image=#{encode_icon('data/icons/messenger.png')}")
