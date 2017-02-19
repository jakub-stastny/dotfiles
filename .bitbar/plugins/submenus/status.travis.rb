# Testing in isolation:
# RUBYLIB=lib:$RUBYLIB ruby submenus/status.travis.rb

# Documentation at https://github.com/travis-ci/travis.rb
require_or_abort 'travis'
require 'yaml'

title 'Travis', 'gray'

begin
  travis_config = YAML.load_file(File.expand_path('~/.travis/config.yml'))
  endpoints = travis_config['endpoints']
  client = Travis::Client.new(access_token: endpoints[endpoints.keys.first]['access_token'])
  active_repos = client.user.repositories.select { |repo| repo.active? }
  active_repos.each do |repo|
    title = "#{SYMBOLS[repo.color.to_sym]} #{repo.name}"
    finished_at = format_time(repo.last_build_finished_at.localtime)
    stats = "#{repo.last_build_duration}s, #{finished_at}"
    href  = "https://travis-ci.org/#{client.user.login}/#{repo.name}"
    puts "#{title} [#{stats}] | color=#{repo.color} href=#{href}"
  end
rescue Travis::Client::SSLError, SocketError
  raise Skip
end
