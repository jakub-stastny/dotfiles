require_or_abort 'tzinfo'

ZONES = %W{Europe/Prague Europe/London America/New_York America/Los_Angeles}

zone = Time.now.strftime('%z')
zone.sub!(/^\+/, "")
zone.sub!(/0(\d+)/, "\\1")
zone.sub!(/(\d+)00/, "\\1")

puts "Current timezone: #{Time.now.strftime("%Z")} #{zone} | color=green"
puts '---'

ZONES.each do |timezone_name|
  timezone = TZInfo::Timezone.get(timezone_name)
  offset_in_hours = timezone.current_period.utc_total_offset_rational.numerator
  offset = '%+.2d:00' % offset_in_hours

  time = Time.now.getlocal(offset)
  puts "#{time.strftime('%H:%M')} #{timezone_name.split('/').last.tr('_', ' ')}"
end
