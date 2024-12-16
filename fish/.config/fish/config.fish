#    __    _  _ 
#   /__\  ( )/ )
#  /(__)\  )  ( 
# (__)(__)(_)\_)
#
# Alexander Köhn, 2021
                

if status is-interactive
    # Set Homebrew path environment
    if test -d /opt/homebrew/bin
        eval (/opt/homebrew/bin/brew shellenv)
    end
    if test -d /home/linuxbrew/.linuxbrew/bin
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    end
end

###
### STANDARD SETTINGS
###
set fish_greeting
set theme_color_scheme terminal

###
### NVM SETUP
###
# Add nvm path to fish_user_paths
if test -d ~/.local/share/nvm
    # Ensure the correct NVM directory is in the path
    set -g fish_user_paths ~/.local/share/nvm/current/bin $fish_user_paths
end

# Automatically use LTS version of Node with nvm
if type -q nvm
    nvm use lts &>/dev/null
end

###
### JAVA SETUP
###
if test -d /usr/libexec/java_home
    set -x JAVA_HOME (/usr/libexec/java_home -v 11)
end
if test -d /usr/local/opt/openjdk@11/bin
    fish_add_path /usr/local/opt/openjdk@11/bin
end

###
### JETBRAINS PATH
###
if test -d /Users/alex/.local/bin/JetBrains
    fish_add_path /Users/alex/.local/bin/JetBrains
end

if test -d ~/Library/Jetbrains/bin
    fish_add_path ~/Library/Jetbrains/bin
end


###
### ALIASES AND CUSTOM FUNCTIONS
###

if type -q nvim
    alias vim=(which nvim)
    alias vi=(which nvim)
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

### ESP_IDF
abbr idf ". $HOME/esp/esp-idf/export.fish"
abbr ipy "idf.py"

### LAZYGIT
if type -q lazygit
    abbr lg "lazygit"
end

### TMUX
abbr t "tmux"
abbr ta "tmux attach"

### EXA
if type -q exa
    # alias ls='exa -l --color=always --group-directories-first --octal-permissions'
    alias la='exa -a --color=always --group-directories-first --octal-permissions'
    alias ll='exa -al --color=always --group-directories-first --octal-permissions'
    alias llt='exa -aT --color=always --group-directories-first'
    alias lt='exa -T --color=always --group-directories-first'
    alias l.='exa -a | egrep "^\."'
    abbr l "ll"
end

if type -q eza
    # alias ls='exa -l --color=always --group-directories-first --octal-permissions'
    alias la='eza -a --color=always --group-directories-first --octal-permissions'
    alias ll='eza -al --color=always --group-directories-first --octal-permissions'
    alias llt='eza -aT --color=always --group-directories-first'
    alias lt='eza -T --color=always --group-directories-first'
    alias l.='eza -a | egrep "^\."'
    abbr l "ll"
end

### CD
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'

if type -q rbenv
### RUBY VERSION MANAGER
set -x PATH $HOME/.rbenv/bin $PATH
rbenv init - | source
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
    function ff
        cd (fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview") && pwd && tree -a -C -L 1
    end
end

if type -q zoxide
    zoxide init fish | source
end

abbr f "z"
abbr gw './gradlew'
abbr md 'mkdir'
abbr khnlx "ssh khnlx@h2888247.stratoserver.net"
abbr sfish "source ~/.config/fish/config.fish"
abbr :q "exit"
abbr -a k3000 'set pids (lsof -i -P -n | grep 3000 | awk \'{print $2}\'); for pid in $pids; kill -9 $pid; end'

alias vion="fish_vi_key_bindings"
alias vioff="fish_default_key_bindings"


function anaconda
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval /Users/alex/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
    # <<< conda initialize <<<
end

