# After updating this file :UpdateRemotePlugins has to be called.

# https://github.com/alexgenco/neovim-ruby
Neovim.plugin do |plugin|
  # Mapped to `td`.
  plugin.command(:MarkTaskAsDone) do |nvim|
    line = nvim.current.line
    # TODO: Use the parser.
    if line.match(/^- \[\d+:\d+-\?+\] /)
      nvim.current.line = line.sub(/^- \[(\d+:\d+)-\?+\] /, "✓ [\\1-#{Time.now.strftime('%H:%M')}] ")
    else
      nvim.current.line = line.sub(/^- /, '✓ ')
    end
    # nvim.current.pos += nvim.current.pos
  end

  # Mapped to `ts`.
  # Starts the active (where the cursor is) OR the next task?
  plugin.command(:StartTask) do
    nvim.current.line = nvim.current.line.sub(/^ -/, "- [#{Time.now.strftime('%H:%M')}-????]")
  end

  # Mapped to `ta`.
  # plugin.command(:ActiveTask)

  #plugin.commmand(:ArchiveTasks)

  # Define an autocmd for the BufEnter event on Ruby files.
  # http://vimdoc.sourceforge.net/htmldoc/autocmd.html
  plugin.autocmd(:BufEnter, pattern: "*.todo") do |nvim|
    # TODO: Go to the next unstarted task.
    nvim.command("echom 'Activating task integration.'")
  end
end
