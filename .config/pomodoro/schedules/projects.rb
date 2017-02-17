# Career and sport-related activities are done on daily/weekly basis.
projects_dir = "#{ENV['HOME']}/Dropbox/Projects"

project('Spirituality')

Dir.glob("#{projects_dir}/{Software,Webs}/*").map do |path|
  project(File.basename(path))
end

project('dotfiles')

Dir.glob("#{projects_dir}/Writing/*").map do |path|
  project(File.basename(path))
end

project('Spanish')
project('English')

# Disabled: blues, general dancing (spins etc).
project('Tap')
project('Tango')

project('Wing chun')
