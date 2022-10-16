set -x GEM_HOME "$HOME/.gems"
set -x PATH "$HOME/.gems/bin:$PATH"
status --is-interactive; and rbenv init - fish | source
