# cd 配置
alias j-s='cd /e/object/SVN/trunk'
alias j-d='cd ~/Desktop'
alias j-p="cd /e/lzo-project"
alias j-p-co="cd /e/lzo-project/COLLECT"

#code 配置
alias c-mis-o="code /e/object/SVN/trunk/mis_oa"
alias c-mis-l="code /e/object/SVN/trunk/mis_oa_line"
alias c-mis-w="code /e/object/SVN/trunk/weixin_mp"
alias c-snmp="code /e/object/SVN/trunk/huihezn-snmp"
alias c-lzo-d="code /e/lzo-project/lzo-docs-blog"
alias c-lzo-e="code /e/lzo-project/lzo-everyday"
alias c-host='code /c/Windows/System32/drivers/etc/hosts'

#指令
alias ll="ls -al"

#git
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gP='git push'
alias gp='git pull'
alias g-ac='git add . && git commit -m'
alias g-p='git add . && git commit -m "auto default" && git push'

#system
alias sysshutdown='shutdown -s -t 0'
alias reboot='shutdown -r -t 0'
alias o="explorer"
alias ..='cd ..'
alias ...='cd ../..'

#tmux 
alias tmuxn='tmux new -s'
alias tmuxa='tmux attach -t'
alias tmuxk="tmux kill-session -t"

