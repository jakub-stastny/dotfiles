Dir.chdir(File.expand_path('../..', __FILE__))

require 'stringio'
require 'socket'

SYMBOLS = {
  green: '✔︎',
  red: '✘',
  yellow: '⛬'
}

def title(text)
  puts "#{text} | color=blue"
end

# def disconnected?
#   %x{networksetup -getairportpower en0}.match(/Off/)
# end

REDIRECTED_STDOUT = StringIO.new
def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = REDIRECTED_STDOUT

  block.call

  captured_stdout = $stdout.string
  $stdout = original_stdout
  return captured_stdout
end

def submenu(captured_stdout)
  puts ['---', captured_stdout].join("\n")
end

def log_path(script)
  File.join(ENV['TMPDIR'], File.basename(script).sub(/\.rb$/, '.log'))
end

def format_time(time)
  if time.strftime('%d.%m') == Time.now.strftime('%d.%m')
    time.strftime('%H:%M')
  else
    time.strftime('%d.%m %H:%M')
  end
end

def cache_command(path)
  log_path = log_path(path)
  captured_stdout = capture_stdout { load path }

  File.open(log_path, 'w') do |file|
    file.puts(captured_stdout)
  end
  puts captured_stdout
rescue SocketError
  if File.exist?(log_path)
    puts File.read(log_path).force_encoding('utf-8')
    puts "~ Cached version from #{format_time(File.mtime(log_path))}."
  end
end
