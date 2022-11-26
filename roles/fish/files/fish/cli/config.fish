set -x LANG 'en_US.UTF-8'
set -x EDITOR 'micro'
set -x VISUAL 'subl'
set -x PAGER 'most'
set -gx SYSTEMD_PAGER 'less'
set -U fish_greeting ""

# Remove time right prompt
function fish_right_prompt
  #intentionally left blank
end

# Start starfish prompt
starship init fish | source
