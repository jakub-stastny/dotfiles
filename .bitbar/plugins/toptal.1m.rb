#!/Users/botanicus/.rubies/ruby-2.4.0/bin/ruby

load File.expand_path('../../lib/bitbar.rb', __FILE__)

# command = read_command('toptal')
command = CachedCommand.new(['New jobs.', 'Interviews.', 'Payment status.', 'Print status from dashboard, rate etc (-> update my config with rate).'], [], 0, Time.now)
command.bitbar("| image=#{encode_icon('data/icons/toptal.ico')}")
