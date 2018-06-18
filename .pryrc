# https://gist.github.com/lfender6445/9919357

begin
  require 'what_methods'

  puts "~ Gem what_methods loaded. Usage: 3.what?(4, 1) # => ['+']"
rescue LoadError
  warn "~ Can't load what_methods."
end

puts "~ Special methods: Object#specific_methods, Class#specific_instance_methods, pbcopy(object), pbpaste, password and timer(&block)."

class Object
  def specific_methods
    (self.methods - Object.new.methods).sort
  end
end

class Class
  def specific_instance_methods
    (self.instance_methods - Class.new.methods).sort
  end
end

# def pbcopy(object)
#   open("| pbcopy", "w") do |stream|
#     stream.puts(object.to_s)
#   end
# end

def pbpaste
  %x{pbpaste}
end

def password
  Array.new(16) { rand(256) }.pack("C*").unpack("H*").first
end

def timer(&block)
  - (Time.now.to_f.tap(&block) - Time.now.to_f)
end

Pry.config.commands.command 'pbcopy', 'Copy input to clipboard' do |input|
  input = input ? target.eval(input) : _pry_.last_result
  IO.popen('pbcopy', 'w') { |io| io << input }
end

Pry.config.commands.command 'html-view', 'Write input to and html file and open it' do |input|
  input = input ? target.eval(input) : _pry_.last_result

  require 'tempfile'
  file = Tempfile.new(['pry-result', '.html'])
  begin
    file.write(input)
    file.rewind
    `open #{file.path}`
  ensure
    file.unlink
  end
end
