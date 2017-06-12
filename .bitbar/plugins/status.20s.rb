#!/Users/botanicus/.scripts/ruby

load File.expand_path('../../lib/bitbar.rb', __FILE__)

output = capture_stdout do
  Dir.glob('plugins/submenus/status.*').map do |script|
    submenu(cache_command(script))
  end
end

puts(output.match(/✘/) ? '✘ | color=red' : '✔︎ | color=green')
puts '---'
puts output
