#    __    _  _ 
#   /__\  ( )/ )
#  /(__)\  )  ( 
# (__)(__)(_)\_)
#
# Alexander Köhn, 2021
                
                

if status is-interactive
	# set homebrew path environment
	eval (/opt/homebrew/bin/brew shellenv)
end

###
### STANDARD STUFF
###
set fish_greeting

###
### ADD PATH
###
fish_add_path ~/Library/Jetbrains/bin
fish_add_path /opt/homebrew/opt/node@14/bin

###
### ALIASES & CUSTOM FUNCTIONS
###

### EXA
if type -q exa
	alias ls='exa -l --color=always --group-directories-first' # my preferred listing
	alias la='exa -a --color=always --group-directories-first'  # all files and dirs
	alias ll='exa -al --color=always --group-directories-first'  # long format
	alias lt='exa -aT --color=always --group-directories-first' # tree listing
	alias l.='exa -a | egrep "^\."'
	alias l='ls'
end

### BAT
if type -q bat
	alias cat='bat'
end


### GCC
if type -q gcc-11
	alias gcc='gcc-11'
	alias cc='gcc-11'
	alias g++='g++-11'
	alias c++='c++-11'
end

### FZF
if type -q fzf
	alias ff='fd . --hidden | fzf --preview "bat {-1} --color=always"'
	alias ffcat='ff | xargs bat'

	# Search for file and open with vim
	function ffvim
		set tmpvar (ff)
		if test -n "$tmpvar"
			vim $tmpvar
		end
		
		# clear variables
		set -e tmpvar
	end


	function ffdiff
		set preview "git diff $argv --color=always -- {-1}"
		# if type -q bat 
		# 	set preview "bat"
		# end
		git diff $argv --name-only --relative | fzf -m --ansi --preview $preview

		set -e preview
	end
end

### MISC
alias cdc="cd ~/Documents/Code"
alias cdd="cd ~/.dotfiles"
alias cdf="cd ~/.dotfiles/fish/.config/fish"
alias md="mkdir"
alias khnlx="ssh khnlx@h2888247.stratoserver.net"
alias sfish="source ~/.config/fish/config.fish"

# Create directory and cd into
function mdc
    mkdir -p -- "$1" &&
    cd -P -- "$1"
end

### TMUX
alias t="tmux"
alias ta="tmux attach"

### DOCKER
alias dockervm='docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh'
alias dockerbash='docker_exec_bash'

# Execute bash(!) shell on given container
function docker_exec_bash
	docker exec -it "$1" /bin/bash
end

