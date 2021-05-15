# Set the environment for the DPM environments.
#
# NOTE: This has to go to project-specific configuration,
# leaving here for now as a reference.
#
# Actually NO, it's required for ~/.scripts/capabilities.
source /usr/local/share/chruby/chruby.sh
chruby $RUBY_VERSION
# See ~/.zsh/env.zsh for $path.

# NOTE: This needs to go to per-project configuration, leaving here for now as a reference.
# Make $RUBYLIB and $rubylib behave like $PATH/$path.
#typeset -T -U -gx -a RUBYLIB rubylib ':'
