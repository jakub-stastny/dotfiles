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
require 'open3'
require 'yaml'

SYMBOLS = {
  green: '✔︎',
  red: '✘',
  yellow: '⛬'
}

class Skip < StandardError
end
class CommandNotFound < StandardError
end

def title(text, color = 'blue')
  puts "#{text} | color=#{color}", '---'
end

# def disconnected?
#   %x{networksetup -getairportpower en0}.match(/Off/)
# end
def require_or_abort(gem_name)
  require gem_name
rescue LoadError => error
  abort "Install the #{gem_name} gem for #{%x{which ruby}.chomp}. | color=red"
end

def config
  @config ||= OpenStruct.new(YAML.load_file('config/bitbar.yml'))
end

def which(command)
  ENV['PATH'].split(':').each do |path_dir|
    exec_path = File.join(path_dir, command)
    return exec_path if File.file?(exec_path) && File.executable?(exec_path)
  end

  return
end

def run_or_fail(command)
  run(command)
rescue CommandNotFound => error
  abort "#{error.message} | color=red"
end

def run(command)
  @commands ||= Hash.new
  return @commands[command] if @commands[command]

  stdin, stdout, stderr, process = Open3.popen3(command)
  if process.value.exitstatus == 127
    raise CommandNotFound.new("Command not found: #{command}\n#{stderr.read}")
  end

  @commands[command] = stdout.readlines.map(&:chomp)
rescue Errno::ENOENT
  raise CommandNotFound.new("Command not found: #{command}")
end

class CachedCommand
  attr_reader :stdout, :stderr, :exit_status, :finished_at
  def initialize(stdout, stderr, exit_status, finished_at)
    @stdout, @stderr, @exit_status, @finished_at = stdout, stderr, exit_status, finished_at
  end

  def bitbar(icon)
    if @stdout.empty? && @stderr.empty?
      exit # show nothing
    end

    puts icon, '---'
    puts @stdout
    puts @stderr
    if @finished_at < Time.now - (10 * 60)
      puts "~ Last updated at #{format_time(@finished_at)}"
    end
    exit @exit_status
  end

  # Copied.
  def format_time(time)
    if time.strftime('%d/%m') == Time.now.strftime('%d/%m')
      time.strftime('%H:%M')
    elsif time.strftime('%d/%m') == (Time.now - 24 * 60 * 60).strftime('%d/%m')
      time.strftime('yesterday at %H:%M')
    else
      time.strftime('%d/%m %H:%M')
    end
  end
end

def read_command(command)
  cache_path = "/tmp/#{command}.yml"
  data = YAML.load_file(cache_path)
  data[:finished_at] = File.mtime(cache_path)
  CachedCommand.new(*data.values_at(:stdout, :stderr, :exit_status, :finished_at))
rescue Errno::ENOENT => error
  CachedCommand.new([error.message], [], 1, Time.now)
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

def read_cache(identifier)
  log_path = File.join('/tmp', identifier)
  if File.exist?(log_path) && ENV['ENV'] != 'test'
    File.read(log_path).force_encoding('utf-8') +
    "\n~ Cached version from #{format_time(File.mtime(log_path))}."
  end
end

def write_cache(identifier, data)
  log_path = File.join('/tmp', identifier)
  File.open(log_path, 'w') do |file|
    file.puts(data)
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
  if File.exist?(log_path) && ENV['ENV'] != 'test'
    puts File.read(log_path).force_encoding('utf-8')
    puts "~ Cached version from #{format_time(File.mtime(log_path))}."
  end
end

require 'base64'
def encode_icon(path)
  Base64.encode64(File.read(path)).delete("\n")
end
