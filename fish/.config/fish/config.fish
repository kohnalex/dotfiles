#    __    _  _ 
#   /__\  ( )/ )
#  /(__)\  )  ( 
# (__)(__)(_)\_)
#
# Alexander Köhn, 2021
                

if status is-interactive
    if test -d /opt/homebrew/bin
	  # set homebrew path environment
	  eval (/opt/homebrew/bin/brew shellenv)
    end
end

###
### STANDARD STUFF
###
set fish_greeting
# set theme_color_scheme terminal-dark
set theme_color_scheme terminal

###
### ADD PATH
###

# TODO: do better solution
set -x XDG_CONFIG_HOME $HOME/.config
set -x JAVA_HOME (/usr/libexec/java_home -v 11)

if test -d /Users/alex/.local/bin/JetBrains
    fish_add_path /Users/alex/.local/bin/JetBrains
end

if test -d ~/Library/Jetbrains/bin
    fish_add_path ~/Library/Jetbrains/bin
end

# if test -d opt/homebrew/opt/node@14/bin
# fish_add_path /opt/homebrew/opt/node@14/bin
# end

# JAVA
if test -d /usr/local/opt/openjdk@11/bin
    fish_add_path usr/local/opt/openjdk@11/bin
end
###
### ALIASES & CUSTOM FUNCTIONS
###

### VIM
if type -q nvim
	alias vim=(which nvim)
	set -Ux EDITOR (which nvim)
end
if type -q neovide
	alias vide=(which neovide)
end

### GIT
if type -q git
  abbr g "git"
  abbr gss "git status -s"
  abbr glo "git log --pretty='%Cred%h%Creset%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"

  abbr ga "git add"
  abbr ga. "git add ."
  abbr gc "git commit -v"
  abbr gc! "git commit --amend"
  abbr gc!! "git commit --amend --no-edit"
  abbr gac "git add . && git commit -v"

  abbr gco "git checkout"
  abbr gco! "git checkout -- ."
  abbr gcob "git checkout -b"

  abbr gp "git push"
  abbr gp! "git push --force"
  abbr gl "git pull"
  abbr glr "git pull --rebase"
  abbr grm "git rebase origin/master"
  abbr gf "git fetch"
  abbr gfa "git fetch --all"
end

### LAZYGIT
if type -q lazygit
  abbr lg "lazygit"
end

### TMUX
abbr t "tmux"
abbr ta "tmux attach"

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
    function ff
        cd (fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview") && pwd && tree -a -C -L 1
    end
end

### MISC
abbr gw './gradlew'
abbr cdc 'cd ~/Documents/Code'
abbr cdd 'cd ~/dotfiles'
alias md="mkdir"
alias khnlx="ssh khnlx@h2888247.stratoserver.net"
alias sfish="source ~/.config/fish/config.fish"
alias :q="exit"

alias vion="fish_vi_key_bindings"
alias vioff="fish_default_key_bindings"

