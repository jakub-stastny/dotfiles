Dir.chdir(File.expand_path('../..', __FILE__))

PATHS = [
  "#{ENV['HOME']}/.scripts",
  "#{ENV['HOME']}/Dropbox/Projects/Software/pomodoro/bin",
  "/usr/local/bin"
]

ENV['PATH'] = (PATHS + ENV['PATH'].split(':')).join(':')

require 'stringio'
require 'socket'
require 'ostruct'
require 'yaml'

SYMBOLS = {
  green: '✔︎',
  red: '✘',
  yellow: '⛬'
}

class Skip < StandardError
end

def title(text, color = 'blue')
  puts "#{text} | color=#{color}", '---'
end

# def disconnected?
#   %x{networksetup -getairportpower en0}.match(/Off/)
# end
def require_or_abort(gem_name)
  require gem_name
rescue LoadError
  abort "Install the #{gem_name} gem for #{%x{which ruby}.chomp}. | color=red"
end

def config
  @config ||= OpenStruct.new(YAML.load_file(File.expand_path('~/.config/bitbar.yml')))
end

def capture_stdout(&block)
  old_stdout = $stdout
  $stdout = StringIO.new
  block.call
  $stdout.string
ensure
  $stdout = old_stdout
end

def submenu(captured_stdout)
  puts ['---', captured_stdout].join("\n")
end

def log_path(script)
  File.join(ENV['TMPDIR'], File.basename(script).sub(/\.rb$/, '.log'))
end

def format_time(time)
  if time.strftime('%d/%m') == Time.now.strftime('%d/%m')
    time.strftime('%H:%M')
  elsif time.strftime('%d/%m') == (Time.now - 24 * 60 * 60).strftime('%d/%m')
    time.strftime('yesterday at %H:%M')
  else
    time.strftime('%d/%m %H:%M')
  end
end

def cache_command(path)
  log_path = log_path(path)
  captured_stdout = capture_stdout { load path }

  File.open(log_path, 'w') do |file|
    file.puts(captured_stdout)
  end
  puts captured_stdout
rescue Skip, SocketError
  if File.exist?(log_path)
    puts File.read(log_path).force_encoding('utf-8')
    puts "~ Cached version from #{format_time(File.mtime(log_path))}."
  end
end
