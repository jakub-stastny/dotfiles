require 'routines'
require 'projects'

# Time schedule:
#   MR 8:20 – 9:50. Work 10:00 – 12:00.
#   Lunch & siesta 12:00 – 13:40.
#   Personal projects 14:00 – 16:00.
#   Offline from 19:20 onwards.
rule(:weekday, -> { today.weekday? }) do |tasks|
  tasks.push(*morning_ritual_tasks)
  tasks << Pomodoro::Task.new('TopTal.', 20, [:online, :work])
  tasks << work_tasks[rand(work_tasks.length)]
  tasks.push(*lunch_break_tasks)
  tasks << Pomodoro::Task.new(project_of_the_week, 90, [:project_of_the_week, :online])
  tasks << cleanup_tasks[rand(cleanup_tasks.length)]
  tasks.push(*evening_tasks)
end

rule(:blog_post, -> { today.tuesday? }) do |tasks|
  project_of_the_week = tasks.find { |task| task.tags.include?(:project_of_the_week) }
  position = tasks.index(project_of_the_week)
  tasks.delete(project_of_the_week)
  tasks.insert(position, Pomodoro::Task.new('Write a blog post.', 90, [:online]))
end

rule(:swimming, -> { today.wednesday? }) do |tasks|
  tasks.delete_if { |task| task.tags.include?(:morning_ritual) }
  tasks.unshift(Pomodoro::Task.new('Swimming.', 90, [:morning_ritual]))
end

rule(:saturday, -> { today.saturday? }) do |tasks|
  tasks.push(*morning_ritual_tasks)

  # Replace dancing by wing chun.
  dancing = tasks.find { |task| task.tags.include?(:dancing) }
  position = tasks.index(dancing)
  tasks.delete(dancing)
  tasks.insert(position || 0, Pomodoro::Task.new('Wing chun.', 90, [:morning_ritual]))

  tasks << Pomodoro::Task.new(project_of_the_week, 90, [:project_of_the_week, :online])
  tasks.push(*lunch_break_tasks)
  tasks << Pomodoro::Task.new('Pilates or yoga.', 90)
  tasks << Pomodoro::Task.new('$ system-upgrade')

  tasks.push(*evening_tasks)
end

# No set time frame.
rule(:sunday, -> { today.sunday? }) do |tasks|
  switch_project_of_the_week

  tasks.push(*morning_ritual_tasks)
  tasks << Pomodoro::Task.new('Reflect on the week.', 90)
  tasks << Pomodoro::Task.new('Journaling.', 90)
  tasks << Pomodoro::Task.new('Laundry.')
  tasks << Pomodoro::Task.new('Go through my moleskine and other papers.')
  tasks.push(*evening_tasks)
end

rule(:first_day_of_a_month, -> { today.day == 1 }) do |tasks|
  # TODO: Proper position.
  tasks << Pomodoro::Task.new('Review SwingPlanit and BluesCal.com.', 20)
end

rule(:last_day_of_a_month, -> { last_work_day_of_a_month == today }) do |tasks|
  # TODO: Proper position.
  tasks << Pomodoro::Task.new('Buy things from the wish list.', 20, [:online])
end

# Taken care off by bitbar.
# rule(:communications, -> { today.monday? || today.friday? }) do |tasks|
#   cleanup = tasks.find { |task| task.tags.include?(:cleanup) }
#   position = tasks.index(cleanup)
#   if today.monday?
#     tasks.insert(position, Pomodoro::Task.new('Gmail, messenger', 20, [:online]))
#   else
#     tasks.insert(position, Pomodoro::Task.new('Gmail inbox 0, messenger, Skype', 20, [:online]))
#   end
# end
