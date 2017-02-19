require_or_abort 'tzinfo'

zone = Time.now.strftime('%z').sub(/^\+/, '').sub(/0?(\d+?)0*/, '\1')

puts "Current timezone: #{Time.now.strftime('%Z')} #{zone} | color=green"
puts '---'

timezones = ENV['timezones'].split(':') rescue config.timezones
timezones.each do |timezone_name|
  timezone = TZInfo::Timezone.get(timezone_name)
  offset_in_hours = timezone.current_period.utc_total_offset_rational.numerator
  offset = '%+.2d:00' % offset_in_hours

  time = Time.now.getlocal(offset)
  puts "#{time.strftime('%H:%M')} #{timezone_name.split('/').last.tr('_', ' ')}"
end
