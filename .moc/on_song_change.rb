#!/usr/bin/env ruby

artist, album, song, filename, duration = ARGV

artist ||= filename.split('/')[-3]
album  ||= filename.split('/')[-2]
song   ||= filename.split('/')[-1].sub(/\.[^.]+$/, '')

title = "#{song} [#{duration}]"
body = "#{album} by #{artist}"

exec <<-SCRIPT
  osascript -e "display notification \\"#{body}\\" with title \\"#{title}\\""
SCRIPT
