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
set theme_color_scheme nord

###
### ADD PATH
###
fish_add_path ~/Library/Jetbrains/bin
fish_add_path /opt/homebrew/opt/node@14/bin

###
### ALIASES & CUSTOM FUNCTIONS
###

### VIM
if type -q nvim
	alias vim='nvim'
end

### GIT
if type -q git
	abbr g "git"
	abbr gss "git status -s"
	abbr glo "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"

	abbr ga "git add"
	abbr ga. "git add ."
	abbr gc "git commit -v"
	abbr gc! "git commit --amend"
	abbr gac "git add . && git commit -v"

	abbr gp "git push"
	abbr gp! "git push --force"
	abbr gl "git pull"
	abbr glr "git pull --rebase"
    abbr grm "git rebase origin/master"
    abbr gf "git fetch"
    abbr gfa "git fetch --all"
end

### EXA
if type -q exa
	alias ls='exa -l --color=always --group-directories-first --octal-permissions' # my preferred listing
	alias la='exa -a --color=always --group-directories-first --octal-permissions'  # all files and dirs
	alias ll='exa -al --color=always --group-directories-first --octal-permissions'  # long format
	alias llt='exa -aT --color=always --group-directories-first' # tree listing all
	alias lt='exa -T --color=always --group-directories-first' # tree listing hide dotfiles TODO: exclude .git & node_modules
	alias l.='exa -a | egrep "^\."'
	abbr l "ll"
end

### CD

alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'


### GCC
if type -q gcc-11
	alias gcc='gcc-11'
	alias cc='gcc-11'
	alias g++='g++-11'
	alias c++='c++-11'
end

### FZF
if type -q fzf
	alias fff='fd . --hidden | fzf --preview "bat {-1} --color=always"'
	alias ffcat='fff | xargs bat'

	# Search for file and open with vim
	function ffv
		set tmpvar (fff)
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

    function ff
        cd (fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview") && pwd && tree -a -C -L 1
    end
end

### MISC
alias cdc="cd ~/Documents/Code"
alias md="mkdir"
alias khnlx="ssh khnlx@h2888247.stratoserver.net"
alias sfish="source ~/.config/fish/config.fish"
alias :q="exit"

alias vion="fish_vi_key_bindings"
alias vioff="fish_default_key_bindings"

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

