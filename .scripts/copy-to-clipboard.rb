#!/usr/bin/env ruby

require 'yaml'
require 'open3'

def make_label(key)
  key.downcase.tr(' ', '-')
end

original_data = YAML.load(DATA.read)
data = original_data.reduce(Hash.new) do |buffer, (key, value)|
  buffer.merge(make_label(key) => value.gsub("\n", "\n\n").chomp)
end

unless ARGV.first
  abort "Usage: #{$0} [key]. Available keys: #{data.keys}"
end

if ARGV.first == '--list'
  require 'json'
  xdata = original_data.keys.map.with_index.reduce({}) do |buffer, (label, index)|
    buffer.merge(data.keys[index] => label)
  end
  puts JSON.generate(xdata)
  exit
end

unless text = data[make_label(ARGV.first)]
  abort "No such key. Available keys: #{data.keys}"
end

Open3.popen3('pbcopy') do |stdin, stdout, stderr|
  stdin.write(text)
end

__END__
TopTal Ruby: >
  Hi,

  I have nearly a decade of experience with Ruby, Ruby on Rails, JavaScript and other web technologies. For the past 3.5+ years I work extensively with JavaScript front-end frameworks, mainly React.js.

  Best regards,

  James

TopTal JavaScript: >
  Hi,

  I have nearly a decade of experience with JavaScript as well as back-end technologies such as Ruby, Ruby on Rails and others. For the past 3.5+ years I work extensively with JavaScript front-end frameworks, mainly React.js.

  Best regards,

  James

Phone number: +420 606 319 641
