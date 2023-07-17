# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lzo-kali/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="xiong-chiamiov"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="ys"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="xiong-chinamiov-plus"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ========================myadd start
alias .='cd ~'
alias ..='cd ..'
alias ...='cd ../..'

alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gP='git push'
alias gp='git pull'
alias g-p='git add . && git commit -m "auto deploy" && git push'

alias c-host='code /mnt/c/Windows/System32/drivers/etc/hosts'
alias c~='code //wsl$/kali-linux/home/lzo-kali'

alias oe="exit"
alias cl1='sudo apt-get autoclean'               # 清理旧版本的软件缓存
alias cl2='sudo apt-get clean'                      # 清理所有软件缓存
alias cl3='sudo apt-get autoremove'           # 删除系统不再使用的孤立软

alias cdd='cd $(find * -type d | fzf)'
alias rand='ranger $(find * -type d | fzf)'
alias vid='vim $(find * -type d | fzf)'
alias vif='vim $(fzf)'

alias git-bash="/mnt/d/Scoop/apps/git/current/bin/bash.exe"
alias powershell="powershell.exe"
alias cmd="cmd.exe"
alias svn='svn.exe'
alias open='explorer.exe'
# debain 类系统
alias apt="sudo apt"
alias apt-get="sudo apt-get"
alias ls="colorls"
alias help="tldr"
alias help2="/home/lzo-kali/.nvm/versions/node/v14.17.0/bin/tldr"

# 软件
basePath=/mnt/d/Scoop/apps/
alias chrome=${basePath}"chromium/current/chrome.exe"
alias wechat=${basePath}"wechat/nightly-20210702/WeChat.exe"
alias wechatwork=${basePath}"wechatwork/current/WXWork.exe"
alias wps=${basePath}"wpsoffice-cn/current/wps.exe"
alias ftp1=${basePath}"8uftp/current/8uftp.exe"
alias utools=${basePath}"utools/current/uTools.exe"
alias qq=${basePath}"qq/current/Bin/QQ.exe"
alias steam=${basePath}"steam/nightly-20210701/steam.exe"

alias typora="/mnt/d/apps/Typora/Typora.exe"
# ========================myadd end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
 [[ -s /home/lzo-kali/.autojump/etc/profile.d/autojump.sh ]] && source /home/lzo-kali/.autojump/etc/profile.d/autojump.sh
export EDITOR=/usr/bin/vim
bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#export W3MIMGDISPLAY_PATH=/usr/lib/w3m/w3mimgdisplay

export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/home/lzo-kali/.pyenv/bin:$PATH"
#if command -v pyenv 1>/dev/null 2>&1; then
if which pyenv > /dev/null; then
 eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
alias git='LANG=zh_CN.utf8 git'
alias man='LANG=zh_CN.utf8 man'
export LANG=zh_CN.UTF-8
export PATH="/home/lzo-kali/.local/bin:$PATH"

#=======================fzf================================
#界面展示这些参数在 fzf --help 中都有，按需配置即可 highlight 预览高亮可能需要安装
export FZF_DEFAULT_OPTS="--border --preview '(highlight -O ansi {} || cat {}) 3> /dev/null | head -500'"
# fzf查找配安装 fd-find
export FZF_DEFAULT_COMMAND="fdfind --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f --hidden"
alias lg='lazygit'

#=======================fuck================================
# 在最后添加如下命令
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)
