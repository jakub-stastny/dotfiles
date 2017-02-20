# Blues & swing:
#   Spins, cake & bake, mooche.
# Salsa:
# Tango:
#   Musicality, walk, weight changes.
# Tap:
#   Shuffle drills.

# https://www.rozectise.cz/cze/
def morning_ritual_tasks
  # Wednesday swimming, Saturday wing chun.
  dance = ['blues & swing', 'salsa', nil, 'tango', 'tap', nil, nil]
  Array.new.tap do |tasks|
    tasks << Pomodoro::Task.new('Breakfast & Spanish.', 50, [:morning_ritual])
    if dance = dance[today.wday - 1]
      tasks << Pomodoro::Task.new("Dancing: #{dance}.", 20, [:dancing, :morning_ritual])
    end
    tasks << Pomodoro::Task.new('Meditation.', 20, [:meditation, :morning_ritual])
    tasks << Pomodoro::Task.new('Review plan for today. $ pomodoro edit', 10, [:morning_ritual])
    tasks << Pomodoro::Task.new('Some something small that is easy to accomplish and makes impact.', 10, [:low_hanging_fruit])
  end
end

def lunch_break_tasks
  Array.new.tap do |tasks|
    tasks << Pomodoro::Task.new('Lunch.', 40, [:lunch_break])
    tasks << Pomodoro::Task.new('Siesta.', 40, [:lunch_break])
    tasks << Pomodoro::Task.new('Headspace.', 20, [:lunch_break, :meditation])
  end
end

def evening_tasks
  Array.new.tap do |tasks|
    tasks << Pomodoro::Task.new('Dinner & read Pocket articles.', 50)
    tasks << Pomodoro::Task.new('Physical clean-up.', 20)
    tasks << Pomodoro::Task.new('Headspace.', 20, [:meditation])
    tasks << Pomodoro::Task.new('Plan tomorrow & punch-off.', 20)
    tasks << Pomodoro::Task.new('Read a book.', 90, [:evening])
  end
end

# 1. Related to my IT business.
#   a) Applying for work on and off TopTal.
#   b) Building my online profile (blog, TopTal, Twitter).
#
# 2. Something else.
#   a) Writing about a topic, such as dancing, and then selling infoproducts (ebooks, course ...).
#
# Coincidentally both mean writing blog.
def work_tasks
  topics = [
    'Work on my online presence (TopTal profile, Twitter etc).',
    'Write a blog post about IT or productivity.',
    'Work on my blog (UI, UX).',
    'Work on my OSS projects (infrastructure, tests, documentation, blog post).',
    'Brainstorm what\'s the fastest way to the cash.'
  ]

  [Pomodoro::Task.new(topics[today.wday - 1], 90, [:online, :work])]
end

def cleanup_tasks
  Array.new.tap do |tasks|
    tasks << Pomodoro::Task.new('Reduce Chrome tabs by 20.', 20, [:online, :cleanup])
    tasks << Pomodoro::Task.new('Evernote clean-up.', 20, [:cleanup])
    tasks << Pomodoro::Task.new('HD clean-up including apps.', 20, [:cleanup])
  end
end
