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

# Get os stats on shell startup
fastfetch

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

# SOURCE vars and functions
dotfiles=(
  .aliases
  .functions
  .env
  .eval
)
for file in "${dotfiles[@]}"; do
  source "$HOME/dotfiles/$file"
done


# bindkey
bindkey -v # vim mode
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey -s '^o' 'lfcd\n' # ctrl + o | lfcd
