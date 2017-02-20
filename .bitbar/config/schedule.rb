# TODO: Display different results based on date and time.
# Most of the time display confirmation emails only.
# On Monday, Wednesday and Friday evenings show everything.
scheduler.every('20m', first: :now) do
  cache_command('gmail')
end

scheduler.every('20m', first: :now) do
  cache_command('messenger')
end

scheduler.every('20m', first: :now) do
  cache_command('toptal')
end
