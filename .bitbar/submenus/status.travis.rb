# Testing in isolation:
# RUBYLIB=lib:$RUBYLIB ruby submenus/status.travis.rb

require 'travis'

SYMBOLS = {
  green: '✔︎',
  red: '✘',
  yellow: '⛬'
}
begin
  key = '4RxBM8VNIHm2N0c7Tbl-Yw'
  # TODO: config
  client = Travis::Client.new(access_token: key)
  active_repos = client.user.repositories.select { |repo| repo.active? }
  title 'Travis'
  active_repos.each do |repo|
    title = "#{SYMBOLS[repo.color.to_sym]} #{repo.name}"
    stats = "#{repo.last_build_duration}s, #{repo.last_build_finished_at.localtime.strftime('%d.%m %H:%M')}"
    href  = "https://travis-ci.org/#{client.user.name}/#{repo.name}"
    puts "#{title} [#{stats}] | color=#{repo.color} href=#{href}"
  end
rescue Travis::Client::SSLError
  raise SocketError # Hack.
end
