# Alice's over-engineered z-shell configuration, released in the public domain.
# Fancy suffix aliases.  Example: *.png

# "Filename suffix" handlers.
if [ $(which url 2>/dev/null) ]; then
	alias -s com='noglob url'
	alias -s org='noglob url'
	alias -s net='noglob url'
	alias -s ca='noglob url'
	alias -s io='noglob url'
	alias -s edu='noglob url'
	alias -s local='noglob url'
	alias -s internal='noglob url'
	alias -s site='noglob url'
fi

# Compression handlers.  We assume tarballs, not naked compressed files.
# TODO: Re-do with some logic to determine if tarball or not.
#alias -s bz2='tar -xjvf'
#alias -s gz='tar -xzvf'
#alias -s xz='tar -xJvf'

# File formats.
if [ $(which open 2>/dev/null) ]; then
	alias -s html='open'
	alias -s gif='open'
	alias -s jpg='open'
	alias -s jpeg='open'
	alias -s png='open'
fi
