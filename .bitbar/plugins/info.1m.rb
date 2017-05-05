#!/Users/botanicus/.rubies/ruby-2.4.1/bin/ruby

load File.expand_path('../../lib/bitbar.rb', __FILE__)

puts '£ | color=blue', '---'

Dir.glob('plugins/submenus/info.*').map do |script|
  begin
    submenu(cache_command(script))
  rescue Skip
  end
end
