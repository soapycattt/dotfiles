# --- ARCH CONFLICT ---
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
  # Neovim Data Dir
  export XDG_DATA_HOME="$HOME/.local/intel/share"
  export XDG_RUNTIME_DIR="/tmp/intel/nvim.user/xxx "
  export XDG_STATE_HOME="$HOME/.local/intel/state"

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

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

#  --- ALIAS ---
alias gcloud="~/google-cloud-sdk/bin/gcloud"
alias v=nvim
alias vim=nvim
alias nvimhome="nvim ~/dotfiles/nvim"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias metabase="java -jar metabase.jar"
alias rcat=cat
alias rls=ls 

alias cat=bat
alias ls=eza

alias venv="source .venv/bin/activate"
alias src=source

## Switch between intel and arm64
alias intel="arch -x86_64 zsh"
alias arm64="arch -arm64 zsh"

# --- ENV VARIABLES ---
export bq_stag=holistics-data-294707
export bq_prod=skilled-fulcrum-90207


# --- PLUGINS ---
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git 
  zsh-syntax-highlighting 
  zsh-autosuggestions
  brew
  asdf
  web-search
  forgit
)


# --- ZSH ---  
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# --- SSH --- 
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Reuse ssh passphrase
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add



# --- VIM KEYBIND --- 
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

function zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[5 q"
}

zle -N zle-keymap-select
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# -- GCLOUD ---
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/soapycat/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/soapycat/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/soapycat/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/soapycat/google-cloud-sdk/completion.zsh.inc'; fi


# -- DIRENV ---
eval "$(direnv hook zsh)"


##  --- FZF ---
export FZF_COMPLETION_TRIGGER='*'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

function fwork(){
  cd $({ find $HOME/Documents/Work/Holistics -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1")
}

function fper(){
  cd $({ find $HOME/Documents/Persona -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1")
}

function fdot(){
  cd $({ find $HOME/dotfiles -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1")
}

function fconf(){
  cd $({ find $HOME/.config -maxdepth 1 -type d -print 2> /dev/null; } | fzf -q "$1")
}

function fwt() {
  cd $({ find . -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1")
}

alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'" # use fp to do a fzf search and preview the files
alias vf='nvim $(fp)' # search for a file with fzf and open it in vim

# --- lf ---
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


# --- SCALA ---
export PATH="$PATH:/Users/soapycat/Library/Application Support/Coursier/bin"
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# --- DBT --- 
alias dbt-docs='dbt docs generate && dbt docs serve'
export DBT_PROFILES_DIR=~/.dbt

## dbt shortcut
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


## fzf-dbt
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


# --- PATH ---
export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS" # IntelliJ IDEA
export PATH="$PATH:/opt/local/bin" # MacPort
export PATH="$PATH:$HOME/.cargo/bin" # Rust
export PATH=/usr/local/apache-maven-3.9.6/bin:$PATH # Maven  TODO: Add mvn setup to dotfile
export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH" # PHP
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH" # PHP

JAVA_HOME="/Users/soapycat/.sdkman/candidates/java/17.0.8.1-tem"
export PATH=$JAVA_HOME/bin:$PATH # JAVA


## zsh-autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=100'


#  --- HOLISTICS ---
## libssh and rugged 
export LOCAL_DIR=/usr/local
export PKG_CONFIG_PATH=$LOCAL_DIR/lib/pkgconfig
export LD_LIBRARY_PATH=$LOCAL_DIR/lib


## Start Holistics 
alias hl="itomate -c  ~/.config/itomate/holistics.yml"
alias holistics="itomate -c  ~/.config/itomate/holistics.yml"

## Terminate Holistics 
function kill-hl() {
    for port in 3000 3036 7004 3555 9777 6379; do 
        kill $(lsof -ti:$port)
    done
}

## Holistics Docs 
export ZSH_WEB_SEARCH_ENGINES=(
  hl-docs "https://docs.holistics.io/search?q="
)
alias hl-docs="web_search hl-docs"

# --- TheFuck ---
eval $(thefuck --alias)
eval $(thefuck --alias fk)


# --- ZSH Completions ---
# https://github.com/zsh-users/zsh-autosuggestions/issues/532
# bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_USE_ASYNC=true

fpath+=${ZDOTDIR:-~}/.zsh_functions


# --- ANACONDA ---
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

