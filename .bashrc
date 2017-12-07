set show-all-if-ambiguous on
set completion-ignore-case on

stty -ixon

SSH_ENV=$HOME/.ssh/environment
HISTSIZE=
HISTFILESIZE=

alias grep='grep --color=always'
alias ll='ls -lhA'
alias ls='ls -CF'
alias lsl='ls -lhFA | less'
alias powershell='C:\\Windows\\sysnative\\WindowsPowerShell\\v1.0\\powershell.exe'

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

function rg {
    /c/ProgramData/chocolatey/bin/rg -p "$@" $(fzf +s --tac | sed 's/\\/\//g') | /c/Program\ Files/Git/usr/bin/less -RFX
}

function code {
    /c/Program\ Files/Microsoft\ VS\ Code/bin/code "$@" $(fzf)
}

function less {
    /c/Program\ Files/Git/usr/bin/less -IRFX $(fzf) "$@"
}

function hist {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# function vim {
#     /c/Program\ Files/Git/usr/bin/vim.exe -S ~/ideget.vim
# }

function fzco() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

function fzshow() { # WIP
    local sha
    sha=$(git log --oneline --no-merges | fzf --ansi --no-sort --reverse --tiebreak=index | grep -o '[a-f0-9]\{10\}' | sed "s/ .*//") &&
    # git show $(echo "$sha" | sed "s/ .*//")
    git flog -1 $(echo "$sha")
    # git flog -1 $(echo "$sha" | sed "s/ .*//")
}

function fzshow1() {
  git log --color=always --oneline --no-merges |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort |
    grep -o '[a-f0-9]\{10\}' | head -1 | git show
#                 xargs -I % sh -c 'git show --color=always % | less -R'
#       --bind "ctrl-m:execute:
#                 (grep -o '[a-f0-9]\{10\}' | head -1 |
#                 xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
#                 {}
# FZF-EOF"
}

function showlogs {
	find /c/OrbLogs -name '*Alkami*.log' -maxdepth 1 -mtime -1 -exec ls -lrt {\} \;
}

function logs {
	find /c/OrbLogs -name '*Alkami*.log' -maxdepth 1 -mtime -1 -exec less +F {\} \;
}

function hosts {
	less /c/Windows/System32/drivers/etc/hosts
}

function wintest {
	find -name *WinTest* -type d -exec cp --parents -r {}/bin/Debug/ ~/Desktop/WinTest/ \;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
 	    start_agent;
	    }
else
     start_agent;
fi