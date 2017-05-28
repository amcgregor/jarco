local cwd="${PWD}" role="${${${(%):-%N}:t}[2,-1]}" script

export ZDOTDIR=${$ZDOTDIR:"$HOME/.zsh"}

for script in $ZDOTDIR/hook/$role/*; do
	source "$script"
done

for script in $ZDOTDIR/plugin/*/*.$role; do
	cd "$(dirname "$script")"
	# echo "> CB $script"
	# echo "> PWD $(pwd)"
	source "$script"
done

cd "$cwd"

unset cwd role script
