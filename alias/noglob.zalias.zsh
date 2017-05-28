# Alice's over-engineered z-shell configuration, released in the public domain.
# Aliases for commands that should not have globbing applied to them.
# Often this is because they apply their own globbing.

# XXX: Proper completions should cover this?
alias find='noglob find'
alias rsync='noglob rsync'
alias scp='noglob scp'
