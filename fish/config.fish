if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR "nvim"
set TERM "alacritty"


# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

#Changing ls to exa
alias ls="exa -la --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"
alias la="exa -a --color=always --group-directories-first"

#Confirm before overwriting
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias tree="tree -C"
alias vim="nvim"

colorscript -r | lolcat
