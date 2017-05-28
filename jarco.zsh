# This file is intended to be sourced into your .zshrc file.

# TODO: Autoloading of all component functions?
# Swaths may be unused by configuration, and some components are independently useful.


# Global configuration.

# Symbology
if [ $DISABLE_UNICODE ]; then
	local s_l=""
	local s_r=""
	local s_L=""
	local s_R=""
	local s_pwd_root="/"
	local s_pwd_home="~"
	local s_pwd_vroot="%"
	local s_pwd_venv="%"
	local s_pwd_project="^"
	local s_pwd_scm="*"
	local s_scm_branch="~"
else
	local s_l=""
	local s_r=""
	local s_L=""
	local s_R=""
	local s_pwd_root="⸙"
	local s_pwd_home="∼"
	local s_pwd_vroot="⩪"
	local s_pwd_venv="⩫"
	local s_pwd_project="⩫"
	local s_pwd_scm="⩫"
	local s_scm_branch=""
fi

# Colors are defined as arrays of (fg bg).

# Logical Primitives
local c_ok=(236 150)
local c_info=(249, 237)

# Themed Prompt Components
local c_pwd_path=$c_info


# Exported configurable globals and results.

# Extend this with your own, in precedence order for path abbreviation.
# For example, if your home folder is nothing but projects, reset __jarco_project_locations to just ($HOME).
# If you use something more complicatd, e.g.: https://softwareengineering.stackexchange.com/a/14609 you will
# want to write a proper searcher instead.
global -A __jarco_projects
global -A __jarco_project_searchers_explicit=(vroot python_venv node_venv)
global -A __jarco_project_searchers_implicit=(scm personal)
global -A __jarco_project_locations=("$HOME/Projects" "$HOME/Documents/Projects" "$HOME/proj")


# Internals

local s_=" "
local c_e="\033[" c_E="m"
local c_n="%{" c_N="%}"
local c_w="${c_n}${c_e}" c_W="${c_E}${c_N}"
local c_r="${c_w}0${c_W}"
local c_rbg="${c_w}49${c_W}"

local __jarco_exit_code=0



# Active Vi Mode

if [ $JARCO_MODE_ABBREV ]; then
	local __jarco_mode_emacs="E"
	local __jarco_mode_normal="N"
	local __jarco_mode_insert="I"
	local __jarco_mode_replace="R"
	local __jarco_mode_visual="V"
	local __jarco_mode_unknown="X"
else
	local __jarco_mode_emacs="emacs"
	local __jarco_mode_normal="normal"
	local __jarco_mode_insert="insert"
	local __jarco_mode_replace="replace"
	local __jarco_mode_visual="visual"
	local __jarco_mode_unknown="unknown"
fi

function __jarco_mode {
	# Identify the current prompt "mode".
	case "$KEYMAP" in
		vicmd*)
			# TODO: Detect visual as the combination of mark set and region active.
			echo "${__jarco_mode_normal}"
			;;
		viins*) echo "${__jarco_mode_insert}" ;;
		*) echo "${__jarco_mode_unknown}" ;;
	esac
}


# Suspended Job Count

function __jarco_jobs {
	# Identify the number of suspended jobs.
	local l_count=0 l_job
	
	while read l_job; do
		[[ ${l_job} == \[* ]] || continue
		l_count+=1
	done < <(jobs)
	
	printf "%s" "${l_count}"
}


# Active Project Search Mechanism

function __jarco_project {
	# Determine if we are operating within a virtual environment or project of some kind.
	# If we are, determine the type and attempt to determine the name.
	# This can be expanded to understand additional project management systems, however this
	# function is limited to only one active project at a time. These must be tested in some
	# order of precedence.
	
	# By the time we're done, this will contain a most to least likely set of potential "active projects".
	declare -A __jarco_projects=()
	
	local -A components=()
	components+=$__jarco_project_searchers_explicit
	componetns+=$__jarco_project_searchers_implicit
	
	# TODO: Iterate and call selected components.
	__jarco_projects+=(("$s_pwd_home", "$HOME", "~")
	__jarco_projects+=(("$s_pwd_root", "/", "/")
	
	# Provide an easier way to know if no specific project was found.
	(( ${#__jarco_projects} == 2 )) && return 1
}

function __jarco_project__vroot {
	# Search for the VIRTUAL_ROOT environment variable, an absolute path.
	[ $VIRTUAL_ROOT ] || return
	__jarco_projects+=(("$s_pwd_vroot", "${VIRTUAL_ROOT}", "${VIRTUAL_ROOT:t}"))
}

function __jarco_project__python_venv {
	# Search for the VIRTUAL_ENV environment variable from Python venv.
	[ $VIRTUAL_ENV ] || return
	__jarco_projects+=(("$s_pwd_venv", "${VIRTUAL_ENV}", "${VIRTUAL_ENV:t}"))
}

function __jarco_project__node_venv {
	# Search for the VIRTUAL_ENV environment variable from Node venv.
	[ $NODE_VIRTUAL_ENV ] || return
	__jarco_projects+=(("$s_pwd_venv", "${NODE_VIRTUAL_ENV}", "${NODE_VIRTUAL_ENV:t}"))
}

function __jarco_project__scm {
	# Utilize "active SCM" search to identify a project.
	__jarco_scm || return
	__jarco_projects+=(("$s_pwd_scm", "${__jarco_scm__path}", "${__jarco_scm__path:t}"))
}

function __jarco_project__personal {
	# Utilize the project search path to identify if any exist, and add them as candidates.
	(( ${#__jarco_project_locations} > 0 )) || return
	
	local base candidate
	
	# TODO: Iterate, compare to CWD and add.
	#__jarco_projects+=(("$s_pwd_project", "${candidate}", "${candidate:t}"))
}


# Current Working Directory Decomposition

global __jarco_pwd
local -A __jarco_pwd_parts

function __jarco_cwd {
	# Break up the current path into individual elements.
	local l_cwd="$PWD" l_cwd_rel l_cwd_parts i_project
	
	# Initialize the projects collection if not already done.
	[ $__jarco_projects ] || __jarco_project
	
	# First we perform whole-string replacements.
	# It's easier to do this prior to the split.
	
	# l_cwd="${l_cwd/#${}/${}}"
	
	# Split up the path component parts.
	__jarco_pwd_parts=(${s:/:)l_cwd})
	
	echo "${l_cwd_rel}" ${l_cwd_parts}
}


# Pretty Prompt

global -A __jarco_prompt_left=(vimode host user project pwd)
global -A __jarco_prompt_right=(scm_branch scm_delta exit)
global __jarco_prompt__host_options="-s"
global -A __jarco_prompt__user_ignore=(amcgregor)

function __jarco_prompt {
	# Generate the PROMPT and RPROMPT values for the shell.
	__jarco_exit_code="${PROMPTLINE_LAST_EXIT_CODE:-$?}"
	
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

function __jarco_prompt__vimode {
	# Contribute the current Vi prompt mode.
}

function __jarco_prompt__host {
	# Contribute the current hostname.
	parts+=(("${c_prompt_host}" "$(hostname ${__jarco_prompt__host_options})"))
}

function __jarco_prompt__user {
	# Contribute the active user.
	local l_id=$(id $UID)
	
	if [ $UID -eq 0 ]; then
		parts+=(("${c_user_root}" "$USER"))
	elif [[ "${l_id}" =~ "(wheel|admin)" ]]; then
		parts+=(("${c_user_super}" "$USER"))
	elif [[ ! "${l_id}" =~ "(staff|users)" ]]; then
		parts+=(("${c_user_system}" "$USER"))
	else
		parts+=(("${c_user_normal}" "$USER"))
	fi
}

function __jarco_prompt__project {
	# Identify the active project.
}

function __jarco_prompt__swd {
	# Render the current working directory, simply, without project awareness.
}

function __jarco_prompt__pwd {
	# Render the current working directory, prettily, and with project awareness.
}

function __jarco_prompt__scm_branch {
	# Render the SCM's current branch.
}

function __jarco_prompt__scm_upstream {
	# Render the SCM's difference between local and upstream (if any is defined).
	# Status color determined by difference and presence of conflicts.
}

function __jarco_prompt__scm_ref {
	# Render the SCM's "current commit reference", whatever that may be.
	# Some systems have the concept of a detached state; status color choice determined by this.
}

function __jarco_prompt__scm_delta {
	# Render the SCM's lines-of-change difference.
}

function __jarco_prompt__exit {
	# Render the last exit status.
	[[ $__jarco_exit_code -eq 0 ]] && return
	parts+=(("${c_exit}" "${__jarco_exit_code}"))
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
