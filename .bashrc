set show-all-if-ambiguous on
set completion-ignore-case on

stty -ixon

SSH_ENV=$HOME/.ssh/environment
HISTSIZE=
HISTFILESIZE=

alias grep='grep --color=always'
alias hist='history'
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

function hosts {
	less /c/Windows/System32/drivers/etc/hosts
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