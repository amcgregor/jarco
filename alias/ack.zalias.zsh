# Alice's over-engineered z-shell configuration, released in the public domain.
# Ack is nice.

# If we don't have it, though, don't bother setting the aliases.
# Installing ack will require re-sourcing your shell configuration.
which ack >/dev/null 2>/dev/null || exit

alias ak='ack -C 3 --smart-case --sort-files'
alias ahtml='ak --type=html'
alias acss='ak --type=css'
alias ajs='ak --type=js'
alias aless='ak --type=less'
alias asass='ak --type=sass'
alias ascss='ak --type=scss'
alias apy='ak --type=python'
