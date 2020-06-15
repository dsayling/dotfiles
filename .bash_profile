# Aliases
alias ll='ls -lG'
alias lla='ls -alG'
alias llr='ls -rtlG'
alias llra='ls -ratlG'
alias ls='ls -G'
alias lsal='ls -Gal'
alias lsl='ls -Gl'
alias lslt='ls -Glt'
#alias tree='tree --dirsfirst -C'

alias cdw='cd ~/Workspace/'
alias cdv='cd ~/Workspace/VirtualEnvs'


alias untarsb='for f in *; do tar -xf $f; done;'

alias ipystart='vim ~/.ipython/profile_default/startup/00-nodes.py'

alias ppath-pwd='export PYTHONPATH=$PYTHONPATH:$PWD'
alias ppath='echo $PYTHONPATH'

alias mypubip="curl http://ipecho.net/plain; echo"

# git aliases
alias gitca="git com -a --amend"
alias gcom="git checkout master"
alias gfm='git fetch origin master:master'

# mercurial aliases
alias hgst='hg st'
alias hginout='hg in; hg out'
alias hgfuck='hg strip --keep -r'

#mmd aliases
alias emailFile='open -a Microsoft\ Outlook'
alias testecho='echo `pwd`'
alias prettyjson='python -m json.tool'

#ssh aliases

alias unset_pypath='unset PYTHONPATH'
alias pypath='echo $PYTHONPATH'



if [ -f `brew --prefix`/etc/local/bash_completion ]; then
	    . `brew --prefix`/etc/local/bash_completion
fi

pycd_function() {
	py_path=`python -c "import $1, os; print os.path.dirname($1.__file__)" |grep -v DEBUG 2>/dev/null`
	if [ $? -ne 0 ]; then
		echo "$1 is not a python module"
		else
		echo "Changing to $py_path"
		cd $py_path
	fi
}
alias pycd=pycd_function

pywhich_function() {
    python -c "import $1; print($1.__file__)"
}

alias pywhich=pywhich_function

export UNTIL_FAIL_SLEEP=5

until_fail_func() {
	$@
	COUNTER=0
	while [ $? -eq 0 ]
	do
		echo "Iteration $COUNTER... complete"
		sleep $UNTIL_FAIL_SLEEP;
		COUNTER=$[COUNTER + 1];
		$@;
	done
}

alias untilf=until_fail_func


# Enable virtualenvwrapper (added by vl_setup)
# source /usr/local/bin/virtualenvwrapper.sh
