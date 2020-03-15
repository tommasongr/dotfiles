########## VARS ##########
export ZSH_CACHE_FOLDER="$HOME/.cache/zsh"

# export ZDOTDIR="$HOME/dotfiles/zsh/extras"

HISTFILE=$ZSH_CACHE_FOLDER/.zsh_history
SAVEHIST=1000

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="tommasongr"

ZSH_CUSTOM=~/dotfiles/zsh/extras/custom/

plugins=(git osx zsh-autosuggestions zsh-syntax-highlighting autoupdate extract node npm colored-man-pages)

source ~/dotfiles/zsh/extras/fixls.zsh
source ~/Library/Preferences/org.dystroy.broot/launcher/bash/br
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

eval "$(pyenv init -)"

# Plugin Config - ZSH_AUTOSUGGESTIONS

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=195"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=false

# Plugin Config - ZSH_SYNTAX_HIGHLIGHTING
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=196
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=196,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=014,underline
ZSH_HIGHLIGHT_STYLES[builtin]=fg=014
ZSH_HIGHLIGHT_STYLES[function]=fg=202,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=046
ZSH_HIGHLIGHT_STYLES[precommand]=fg=046,bold
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=197
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=011,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=013
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=013
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# Plugin Config - AUTOUPDATES

export UPDATE_ZSH_DAYS=7

########## ALIASES ##########

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Get week number
alias week='date +%V'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Reload the shell
alias reload="source ~/.zshrc"

# Brew update
alias brewup="brew update; brew outdated; brew upgrade; brew cleanup"

# Tldr shorthand
alias sumup="tldr"

# Open a note with MarkText
alias marktext="open -a 'Mark Text'"

########## FIXES ##########

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

########## FUNCTIONS ##########

function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}
