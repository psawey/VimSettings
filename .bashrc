export TERM=msys
set show-all-if-ambiguous on
set completion-ignore-case on

SSH_ENV=$HOME/.ssh/environment
HISTSIZE=5000
HISTFILESIZE=10000

alias grep='C:\\cygwin64\\bin\\grep --color=auto'
alias hist='history 5000'
alias ll='ls -lhA'
alias ls='ls -CF'
alias lsl='ls -lhFA | less'

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
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
