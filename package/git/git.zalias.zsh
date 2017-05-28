# Alice's over-engineered z-shell configuration, released in the public domain.
# Very short aliases related to the Git SCM system.

# Don't set the aliases if there's no git installed.
# Not entirely sure how you'd be running this without it.
which git >/dev/null 2>/dev/null || exit 0

alias br='git branch'
alias ci='noglob git commit'
alias co='git checkout'
alias ga='git add'
alias gd='git diff'
alias gdno='git diff --name-only'
alias gds='git diff --stat'
alias gf='git fetch'
alias gint='git init'
alias gpd='git pull'
alias gpu='git push'
alias gr='git remote'
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grh='git reset --hard'
alias gs='git status -s'
alias gst='git stash'
alias st='git status'
