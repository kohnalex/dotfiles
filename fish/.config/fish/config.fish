if status is-interactive
    # Commands to run in interactive sessions can go here
end

### STANDARD STUFF ###
set fish_greeting

### ALIASES ###
## Brew vs. MacOS Remappings
alias gcc='gcc-11'
alias cc='gcc-11'
alias g++='g++-11'
alias c++='c++-11'
alias vim="/opt/homebrew/bin/vim"

# Sonstige
alias ff='cd_with_fzf_home'
alias ffc='cd_with_fzf'
alias tt='tree -a -C -L 2'
alias cdc="cd ~/Documents/Code"
alias md="mkdir"
alias py="python3"
alias t="tmux"

# alias khnlx="ssh -i ~/.ssh/my_keys/khnlx_id_rsa -t alex@h2888247.stratoserver.net"
alias khnlx="ssh khnlx@h2888247.stratoserver.net"

# docker
alias dockervm='docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh'
alias dockerbash='docker_exec_bash'
function docker_exec_bash
	docker exec -it "$1" /bin/bash
end

# Eigene Funktionen
# Ordner erstellen und reingehen
function mdc
    mkdir -p -- "$1" &&
    cd -P -- "$1"
end

# Ordner mit fzf finden mit $HOME als root
function cd_with_fzf_home 
    cd $HOME && cd "(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview")" && pwd && tree -a -C -L 1
end
# Ordner mit fzf finden mit (pwd) als root
function cd_with_fzf 
    cd "(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview")" && pwd && tree -a -C -L 1
end 