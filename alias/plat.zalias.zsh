# Alice's over-engineered z-shell configuration, released in the public domain.
# Conditional aliases which cover up platform differences.
# I like some of my commands to act consistently across platforms.

if [[ $OSTYPE == darwin* ]]; then
	alias d='du -h -d 1'
	alias grep='grep --colour'
	alias ls='ls -G'
	
	# These are distinctly Mac.
	alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
else
	alias d='du --total -h --max-depth=1'
	alias ls='ls --color=auto'
fi
