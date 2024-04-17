# Use the homebrew version accodrding to the machine architecture
ARCH=$(arch)
if [[ ${ARCH} == "arm64" ]]
then
  # On ARM macOS, this script installs to /opt/homebrew only
  HOMEBREW_PREFIX="/opt/homebrew"
  HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
  PATH='/opt/homebrew/bin':$PATH
else
  # On Intel macOS, this script installs to /usr/local only
  HOMEBREW_PREFIX="/usr/local"
  HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
  PATH='$HOMEBREW_REPOSITORY/bin':$PATH
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U colors && colors

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export DBT_PROFILES_DIR=/Users/soapycat/Documents/Work/Holistics/dbt/profiles
export DBT_PROFILES_DIR=~/.dbt

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# alias
alias gcloud="~/google-cloud-sdk/bin/gcloud"
alias venv="source .venv/bin/activate"
alias v=nvim
alias src=source
alias nvimhome="nvim ~/.config/nvim"
alias hl="itomate -c  ~/.config/itomate/holistics.yml"


function kill-hl() {
    for port in 3000 3036 7004 3555 9777 6379; do 
        kill $(lsof -ti:$port)
    done
}
## fzf alias 
### use fp to do a fzf search and preview the files
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
### search for a file with fzf and open it in vim
alias vf='nvim $(fp)'
# setup metabase
alias metabase="java -jar metabase.jar"
## dbt alias
alias dbt_refresh='dbt clean ; dbt deps ; dbt seed'
alias open_dbt_docs='dbt docs generate && dbt docs serve'
## Tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"


# Vim kebinding 
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
if [[ ${KEYMAP} == vicmd ]] ||
  [[ $1 = 'block' ]]; then
  echo -ne '\e[1 q'
elif [[ ${KEYMAP} == main ]] ||
  [[ ${KEYMAP} == viins ]] ||
  [[ ${KEYMAP} = '' ]] ||
  [[ $1 = 'beam' ]]; then
  echo -ne '\e[5 q'
fi
}
zle -N zle-keymap-select
zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git 
  zsh-syntax-highlighting 
  zsh-autosuggestions
  brew
  asdf
  web-search
  fzf-zsh-completions
  # zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/soapycat/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/soapycat/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/soapycat/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/soapycat/google-cloud-sdk/completion.zsh.inc'; fi


CFLAGS="-I$(brew --prefix openssl)/include" 
LDFLAGS="-L$(brew --prefix openssl)/lib"


# /usr/local/bin/brew
#Setup asdf
# . $HOME/.asdf/asdf.sh

#Hook direnv
eval "$(direnv hook zsh)"

#JAVA
# JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home"
# JAVA_HOME="/opt/homebrew/Cellar/openjdk/20.0.1/libexec/openjdk.jdk/Contents/Home"
# JAVA_HOME="/opt/homebrew/Cellar/openjdk/11.0.20.1/libexec/openjdk.jdk/Contents/Home"
JAVA_HOME="/Users/soapycat/.sdkman/candidates/java/17.0.8.1-tem"

#java openjdk
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=$JAVA_HOME/bin:$PATH


## fzf config
export FZF_COMPLETION_TRIGGER='*'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fwork(){
  cd $({ find $HOME/Documents/Work/Holistics -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1")
}

function fper(){
  cd $({ find $HOME/Documents/Persona -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1")
}

function fwt() {
  cd $({ find . -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1")
}



#reuse ssh passphrase
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add


#setup fzf-dbt
FZF_DBT_PATH=~/.fzf-dbt/fzf-dbt.sh
if [[ ! -f /Users/soapycat/.fzf-dbt/fzf-dbt.sh ]]; then
  FZF_DBT_DIR=/Users/soapycat/.fzf-dbt
  print -P "%F{green}Installing fzf-dbt into /Users/soapycat/.fzf-dbt%f"
  mkdir -p /Users/soapycat/.fzf-dbt
  command curl -L https://raw.githubusercontent.com/Infused-Insight/fzf-dbt/main/src/fzf_dbt.sh > /Users/soapycat/.fzf-dbt/fzf-dbt.sh &&         print -P "%F{green}Installation successful.%f" ||         print -P "%F{red}The download has failed.%f"
fi

export FZF_DBT_PREVIEW_CMD="cat {}"
export FZF_DBT_HEIGHT=80%
source /Users/soapycat/.fzf-dbt/fzf-dbt.sh


# php
export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}
bindkey -s '^o' 'lfcd\n'


# Coursier scala
export PATH="$PATH:/Users/soapycat/Library/Application Support/Coursier/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# dbt shortcut
function dbt_run_changed() {
  children=$1
  models=$(git diff --name-only | grep '\.sql$' | awk -F '/' '{ print $NF }' | sed "s/\.sql$/${children}/g" | tr '\n' ' ')
  echo "Running models: ${models}"
  dbt run --models $models
}

function cycle_logs() {
  suffix=$(date '+%Y-%m-%dT%H:%M:%S')
  mv -v logs/dbt.log logs/dbt.log.${suffix}
}


## IntellJ Launcher 
export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS"

# solve compatitibly issue between zsh-vim and fzf 
# https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#execute-extra-commands
## The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
## The plugin will auto execute this zvm_after_lazy_keybindings function
function zvm_after_lazy_keybindings() {
  bindkey -M vicmd 's' your_normal_widget
  bindkey -M visual 'n' your_visual_widget
}

## bigquery project
export bq_stag=holistics-data-294707
export bq_prod=skilled-fulcrum-90207

## zsh-autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=100'

## Add MacPort to shell path
export PATH="$PATH:/opt/local/bin"

## Add Maven to shell path 
export PATH=/usr/local/apache-maven-3.9.6/bin:$PATH
### TODO: Add mvn setup to dotfile
#

# Add Rust app to PATH
export PATH="$PATH:$HOME/.cargo/bin"

# Setuo Holistics
## libssh and rugged 
export LOCAL_DIR=/usr/local
export PKG_CONFIG_PATH=$LOCAL_DIR/lib/pkgconfig
export LD_LIBRARY_PATH=$LOCAL_DIR/lib
