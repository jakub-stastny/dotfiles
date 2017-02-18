#!/Users/botanicus/.rubies/ruby-2.4.0/bin/ruby

Dir.chdir('/Users/botanicus/.bitbar')

puts 'i | color=blue'

output = Dir.glob('submenus/info.*').map do |script|
  ['---', %x{#{script}}].join("\n")
end.join("\n")

puts output
