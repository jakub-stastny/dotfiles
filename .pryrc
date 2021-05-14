# Pry cheatsheet: https://gist.github.com/lfender6445/9919357

begin
  require 'what_methods'

  puts "~ Gem what_methods loaded. Usage: 3.what?(4, 1) # => ['+']"
rescue LoadError
  warn "~ Can't load what_methods."
end

puts "~ Special methods: Object#specific_methods, Class#specific_instance_methods and timer(&block)."

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

def timer(&block)
  - (Time.now.to_f.tap(&block) - Time.now.to_f)
end
