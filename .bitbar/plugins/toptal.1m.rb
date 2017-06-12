#!/Users/botanicus/.scripts/ruby

load File.expand_path('../../lib/bitbar.rb', __FILE__)

command = read_command('toptal')
command.bitbar("| image=#{encode_icon('data/icons/toptal.ico')}")
