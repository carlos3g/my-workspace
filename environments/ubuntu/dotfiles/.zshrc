# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Android Studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/12.0/bin

# Java
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# WSL2
export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037
export REACT_NATIVE_PACKAGER_HOSTNAME=$(ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
#export ADB_TRACE=adb
export ANDROID_SERIAL=emulator-5554

export BAT_THEME='ansi'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# MARK: User configuration

# Personal aliases
alias copy='xclip -selection clipboard -i $1'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias git-clean-branchs='git fetch -p && for branch in `git branch -vv --no-color | grep ": gone]" | awk "{print $1}"`; do git branch -D $branch; done'
alias fzf-update='cd ~/.fzf && git pull && ./install'
alias fzf-finder='find * -type f | fzf > /tmp/fzf-selected-dir'
alias fzf-copy-selected='copy /tmp/fzf-selected-dir'
alias reload="source ~/.zshrc"
alias myip='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'
alias get="curl -O -L"
# See: https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0
alias font-rebuild-cache='fc-cache -fv'

# WSL2
alias windows-delete-identifiers='cd ~ && find . -name "*:Zone.Identifier" -type f -delete'
alias wsl-relays='socat -d -d TCP-LISTEN:5037,reuseaddr,fork TCP:$(cat /etc/resolv.conf | tail -n1 | cut -d " " -f 2):5037'
alias wsl-adb-server='adb.exe kill-server && adb.exe -a -P 5037 nodaemon server'
alias wsl-port-forward-show-all='netsh.exe interface portproxy show all'
alias wsl-port-forward-reset='netsh.exe interface portproxy reset'

_exists() {
  command -v $1 > /dev/null 2>&1
}

wsl-port-forward() { # needs to be a function. related (i think): https://unix.stackexchange.com/a/516192
  netsh.exe interface portproxy add v4tov4 listenport=$1 listenaddress=0.0.0.0 connectport=$1 connectaddress=$REACT_NATIVE_PACKAGER_HOSTNAME
}

laravel-setup-sail() {
  docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php83-composer:latest \
    composer install --ignore-platform-reqs
}

docker-reset() {
  docker container stop $(docker ps -aq)
  docker container rm $(docker ps -aq)
  docker rmi $(docker images -q)
  docker volume rm $(docker volume ls -q)
}

fix-permissions() {
  find . -type d -print0 | xargs -0 chmod 0755
  find . -type f -print0 | xargs -0 chmod 0644
}

zsh_history_fix() {
  # See: https://gist.github.com/acampagnaro/97709e922f7569e67f0ef92ec7d5fcb3
  mv ~/.zsh_history ~/.zsh_history_bad
  strings ~/.zsh_history_bad > ~/.zsh_history
  fc -R ~/.zsh_history
}

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  node
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

# Set name of the theme to load
ZSH_THEME="spaceship"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  asdf
)

_zshrc_private_source_oh_my_zsh() {
  source $ZSH/oh-my-zsh.sh
}

_zshrc_private_install_zinit() {
  ### Added by Zinit's installer
  if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
      print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
      command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
      command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
          print -P "%F{33} %F{34}Installation successful.%f%b" || \
          print -P "%F{160} The clone has failed.%f%b"
  fi

  source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  # Load a few important annexes, without Turbo
  # (this is currently required for annexes)
  zinit light-mode for \
      zdharma-continuum/zinit-annex-as-monitor \
      zdharma-continuum/zinit-annex-bin-gem-node \
      zdharma-continuum/zinit-annex-patch-dl \
      zdharma-continuum/zinit-annex-rust

  ### End of Zinit's installer chunk
}

_zshrc_private_install_zinit_plugins() {
  zinit light zdharma-continuum/fast-syntax-highlighting
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-completions
  zinit light spaceship-prompt/spaceship-prompt
}

_zshrc_private_source_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  export PATH="$PATH:$(yarn global bin)"
}

_zshrc_private_install_fzf() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  eval "$(fzf --zsh)"
}

_zshrc_private_source_pnpm() {
  # pnpm
  export PNPM_HOME="/home/carlos3g/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
  # pnpm end
}

_zshrc_private_source_cargo() {
  if [ -e $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
  fi
}

_zshrc_private_alias() {
  if _exists pnpm; then
    alias pn=pnpm
  fi
}

_zshrc_private_alias_overrides() {
  if _exists fzf; then
    alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
  fi

  if _exists eza; then
    alias ls="eza --icons --group-directories-first"
  fi

  if _exists bat; then
    alias cat="bat --style=auto"
  fi
}

_zshrc_private_source_oh_my_zsh
_zshrc_private_install_zinit
_zshrc_private_install_zinit_plugins
_zshrc_private_source_nvm
_zshrc_private_install_fzf
_zshrc_private_source_pnpm
_zshrc_private_source_cargo
_zshrc_private_alias
_zshrc_private_alias_overrides
