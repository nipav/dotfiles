# Return if the shell is not interactive
[[ $- != *i* ]] && return

HISTCONTROL=erasedups
HISTSIZE=10000
shopt -s histappend

alias ll='ls -lh'
alias ls='ls -F'

ssh_setup() {
	local ssh_agent_info=$(~/bin/start-ssh-agent)
	local ssh_agent_sock=$(echo $ssh_agent_info | cut -d : -f 1)
	local ssh_agent_pid=$(echo $ssh_agent_info | cut -d : -f 2)

	export SSH_AUTH_SOCK="$ssh_agent_sock"
	export SSH_AGENT_PID="$ssh_agent_pid"
}
ssh_setup

gen_prompt() {
	local last_cmd_exit=$?
	local git_branch=$(git branch --show-current 2>/dev/null)

	local blue='\[\e[1;34m\]'
	local cyan='\[\e[0;36m\]'
	local green='\[\e[0;32m\]'
	local magenta='\[\e[0;35m\]'
	local red='\[\e[1;31m\]'
	local reset='\[\e[0m\]'
	local yellow='\[\e[0;33m\]'

	PS1=''
	[[ $last_cmd_exit -ne 0 ]] && PS1+="$red[$last_cmd_exit]$reset "
	[[ -n "$git_branch" ]] && PS1+="$blue($git_branch)$reset "
	[[ $UID -eq 0 ]] && PS1+="${red}ROOT$reset" || PS1+="$green\u$reset"
	PS1+="$cyan@$magenta\h$cyan:$yellow\w$cyan\$$reset "
}

PROMPT_COMMAND=gen_prompt
