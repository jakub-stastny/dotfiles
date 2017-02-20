# Testing in isolation:
# ruby -Ilib -rbitbar plugins/submenus/status.travis.rb
# RUBYLIB=lib:$RUBYLIB ruby submenus/status.travis.rb

# Documentation at https://github.com/travis-ci/travis.rb
require_or_abort 'travis'
require 'yaml'

title 'Travis', 'gray'

begin
  travis_config = YAML.load_file(File.expand_path('~/.travis/config.yml'))
  endpoints = travis_config['endpoints']
  client = Travis::Client.new(access_token: endpoints[endpoints.keys.first]['access_token'])
  client.user.repositories.each(&:active?) # There is a bug. If we run it only once, we get incorrect results.
  # Show only active repos that belong to the end user directly, not to any orgs.
  active_repos = client.user.repositories.select { |repo| repo.active? && repo.owner.login == client.user.login }
  active_repos.each do |repo|
    # Repos with no builds have no colour. I think they had before?
    colour = repo.color.to_sym rescue :yellow
    title = "#{SYMBOLS[(colour)]} #{repo.name}"
    # href  = "https://travis-ci.org/#{client.user.login}/#{repo.name}"
    href  = "https://travis-ci.org/#{repo.attributes['slug']}"
    if repo.last_build_finished_at
      finished_at = format_time(repo.last_build_finished_at.localtime)
      stats = "#{repo.last_build_duration}s, #{finished_at}"
      puts "#{title} [#{stats}] | color=#{colour} href=#{href}"
    else
      puts "#{title} | color=#{colour} href=#{href}"
    end
  end
rescue Travis::Client::SSLError, SocketError
  raise Skip
end
