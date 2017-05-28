# Pretty Prompt

# TODO: Declare autoloading for renderers.

global __jarco__exit_status=0

global -A __jarco_prompt_left=(vimode host user project pwd)
global -A __jarco_prompt_right=(scm_branch scm_delta exit)
global __jarco_prompt__host_options="-s"
global -A __jarco_prompt__user_ignore=(amcgregor)


function __jarco_prompt {
	# Generate the PROMPT and RPROMPT values for the shell.
	
	# Preserve the exit status of the previously invoked command.
	__jarco__exit_status=${LAST_EXIT_CODE:-$?}
	
	PROMPT="$(__jarco_prompt__left)"
	RPROMPT="$(__jarco_prompt__right)"
}

function __jarco_prompt__left {
	# Collect and render the left-hand prompt.
	echo "left>"
}

function __jarco_prompt__right {
	# Collect and render the right-hand prompt.
	# Remember to iterate the generated chunks in reverse!
	# (The components should not be aware they're reversed.)
	echo "<right"
}


# Register ourselves as a prompt command.

if [[ ! "$PROMPT_COMMAND" == *__jarco_prompt* ]]; then
	PROMPT_COMMAND='__jarco_prompt;'$'\n'"$PROMPT_COMMAND"
fi


# Get notified and reinitialize the prompt when changing Vi-modes.

zle-keymap-select() {
	__jarco_prompt
	() { return $__prompt_status }
	zle reset-prompt
}

zle-line-init() {
	typeset -g __prompt_status="$?"
}

zle -N zle-keymap-select
zle -N zle-line-init
