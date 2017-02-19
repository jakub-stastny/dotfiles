require 'date'

# raise Skip if not config.currently_working

start_of_the_engagement = Time.new(2017, 1, 1)

start_of_the_current_cycle = start_of_the_engagement
until start_of_the_current_cycle > (Time.now - 14 * 24 * 60 * 60)
  start_of_the_current_cycle += 14 * 24 * 60 * 60
end

end_of_the_current_cycle = start_of_the_current_cycle + 14 * 24 * 60 * 60
range = (start_of_the_current_cycle.to_date..end_of_the_current_cycle.to_date)

days_worked = range.select do |date|
  begin
    path = File.join(File.expand_path(config.task_archive_path), "#{date.strftime('%Y-%m-%d')}.todo")
    data = File.read(path)
    data.match(/#toptal/)
  rescue Errno::ENOENT
  end
end

days_off = (range.to_a - days_worked.to_a).reject { |day| day.saturday? or day.sunday? }

title "TopTal (#{start_of_the_current_cycle.strftime('%d/%m')} – #{end_of_the_current_cycle.strftime('%d/%m')})"
puts "Days worked: #{days_worked.length} $#{days_worked.length * config.daily_rate}. Days off: #{days_off.length}."
puts "Days off: #{days_off.map { |day| day.strftime('%a %d/%m') }.join(', ')}"
