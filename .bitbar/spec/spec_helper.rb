ENV['ENV'] = 'test'

require 'open3'

class BitBarParser
  def initialize(plugin)
    @command = Dir.glob("./plugins/#{plugin}").first
    p [:pwd, Dir.pwd, Dir.glob('./plugins/*'), @command] ###
  end

  def parse(extra_env = Hash.new)
    initial_env = ENV.to_hash
    extra_env.each { |key, value| ENV[key] = value }
    stdin, stdout, stderr, waiter = Open3.popen3(@command)
    BitBarParserPluginOutput.new(
      stdout.readlines.map(&:chomp),
      stderr.readlines.map(&:chomp),
      waiter.value.exitstatus)
  ensure
    initial_env.each { |key, value| ENV[key] = value }
  end

  def to_s
    "$ #{@command}"
  end
end

class BitBarParserPluginOutput
  attr_reader :stderr_lines, :exitstatus
  def initialize(stdout_lines, stderr_lines, exitstatus)
    @stdout_lines = stdout_lines.map { |line| line.split(/\s*\|\s*/)[0] }
    @stderr_lines = stderr_lines
    @exitstatus = exitstatus
  end

  def title
    if @stdout_lines.length == 0
      # noop
    elsif @stdout_lines.length == 1
      @stdout_lines[0]
    else
      raise 'No separator.' unless @stdout_lines[1] == '---'
      @stdout_lines[0]
    end
  end

  def lines
    @stdout_lines[2..-1] || []
  end
end
