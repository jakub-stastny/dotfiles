#!/usr/bin/env ruby

# Show nothing if disconnected.
exit if %x{networksetup -getairportpower en0}.match(/Off/)

Dir.chdir('/Users/botanicus/.bitbar')

output = Dir.glob('submenus/status.*').map do |script|
  ['---', %x{#{script}}].join("\n")
end.join("\n")

# When run from the command-line with the same Ruby interpreter,
# it works, but when BitBar launches it, it defaults to ASCII.
output = output.force_encoding('utf-8')

puts(output.match(/✘/) ? '✘ | color=red' : '✔︎ | color=green')
puts output
