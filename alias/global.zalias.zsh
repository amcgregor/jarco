# Alice's over-engineered z-shell configuration, released in the public domain.
# Fancy global aliases.  Example: ls G .py W
#
# True Power of UNIX Example
# gdno @{1}.. XA qfile -Cq XANE equery files G init.d/ S -u
# git diff --name-only @{1}.. | xargs qfile -Cq | xargs --no-run-if-empty equery files | grep init.d/ | sort -u

alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g N='&> /dev/null'
alias -g NS='| sort -n'
alias -g RNS='| sort -nr'
alias -g S='| sort'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g W='| wc -l'
alias -g XA='| xargs'
alias -g XANE='| xargs --no-run-if-empty'
