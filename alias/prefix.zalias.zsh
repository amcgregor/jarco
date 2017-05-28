# Alice's over-engineered z-shell configuration, released in the public domain.
# Fancy prefix aliases.  Example: http://example.com

# Vim-like "edit this file" mockery.
alias :e='$VISUAL'

which open >/dev/null 2>/dev/null || return

# Not suffix aliases, but grouped with the URL handlers below.
alias http://='open http://'
alias https://='open https://'
alias sftp://='open sftp://'
alias irc://='open irc://'
