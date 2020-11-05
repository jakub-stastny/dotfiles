#!/usr/bin/env ruby

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def format_sentence(list, &block)
  case list.length
  when 0 then ''
  when 1 then block.call(list[0])
  when 2 then "#{block.call(list[0])} and #{block.call(list[1])}"
  else
    "#{list[0...-1].map(&block).join(', ')} and #{block.call(list[-1])}"
  end
end

def line(header, list)
  unless list.empty?
    puts "#{colorize("#{header}:", 32)} #{format_sentence(list.sort) { |text| colorize(text, 37) }}."
  end
end

git_aliases = %x{git config --get-regexp alias\.}.scan(/^alias\.([^\s]+)/).flatten
dotfiles_aliases = %x{git --git-dir=#{ENV['HOME']}/.dotfiles.git config --get-regexp alias\.}.scan(/^alias\.([^\s]+)/).flatten
dotfiles_specific_aliases = dotfiles_aliases - git_aliases

custom_executables = ENV['PATH'].split(':').
  select { |dir| dir.match(ENV['HOME']) && ! dir.match(/\bruby\b/) }.
  map { |dir| Dir.glob("#{dir}/*") }.flatten.
  select { |path| File.file?(path) && File.executable?(path) }.
  uniq.
  map { |executable| File.basename(executable) }

git_executables = custom_executables.select { |executable| executable.match(/^git-/) }
custom_executables_no_git = custom_executables - git_executables
git_executables.map! { |command| command[4..-1] }

line "Git aliases", git_aliases
line "Dotfiles aliases", dotfiles_specific_aliases
line "Git executables", git_executables
line "Scripts", custom_executables_no_git
