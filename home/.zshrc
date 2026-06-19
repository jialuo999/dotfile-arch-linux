#------------------------上下选择键交互tab----------------------------------
autoload -Uz compinit
compinit

#菜单选择
zstyle ':completion:*' menu select
#忽略大小写补全
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
#允许单词中间补全
setopt COMPLETE_IN_WORD
#交互菜单使用ls配色规则
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#-------------------------------主题-------------------------------------------
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
#COMPLETION_WAITING_DOTS="true"

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


# -----------------------------插件设置--------------------------------------
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
#
plugins=(git zsh-autosuggestions zsh-completions fast-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#---------------快捷键绑定------------------------------------
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

#--------------使用starship提示头-----------------------------
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export STARSHIP_CONFIG="$HOME/.config/starship/${XDG_CURRENT_DESKTOP:l}.toml"
eval "$(starship init zsh)"

#--------------历史记录行压缩-----------------------------------
_TRANSIENT_PROMPT_ACTIVE=0

function _starship_transient_prompt_func() {
  # 只在第一次触发时（即提交那一行）简化
  if [[ $_TRANSIENT_PROMPT_ACTIVE -eq 0 ]]; then
    _TRANSIENT_PROMPT_ACTIVE=1
    PROMPT=$(starship module character)
    zle .reset-prompt
  fi
}

function _starship_reset_transient() {
  # 每次新提示符出现前重置标志位，恢复完整 prompt
  _TRANSIENT_PROMPT_ACTIVE=0
  PROMPT=$(starship prompt)   # 恢复完整 starship 提示符
}

zle -N zle-line-finish _starship_transient_prompt_func
precmd_functions+=(_starship_reset_transient)

#---------------yazi使用两套配色---------------------------------
yazi() {
     local desktop="${XDG_CURRENT_DESKTOP:l}"   
    if [[ "$desktop" == "niri" ]]; then
        YAZI_CONFIG_HOME=~/.config/yazi command yazi "$@"
    else
        YAZI_CONFIG_HOME=~/.config/yazi_kde command yazi "$@"
    fi
}
#--------------btop使用两套配色---------------------------------
btop() {
    local desktop="${XDG_CURRENT_DESKTOP:l}"
    
    if [ -f "$HOME/.config/btop/btop_${desktop}.conf" ]; then
        command btop --config "$HOME/.config/btop/btop_${desktop}.conf" "$@"
    else
        command btop "$@"
    fi
}

#---------------napcat and astrbot in docker-----------------------
alias bot-start="sudo systemctl start docker && cd /home/jialuo/.config/docker_qq_bot && sudo docker compose up -d"

alias bot-stop="cd /home/jialuo/.config/docker_qq_bot && sudo docker compose down && sudo systemctl stop docker.service docker.socket"

#----------------path export--------------------------------------------
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

export PATH="$PATH:$HOME/fvm/versions/stable/bin"
