# This file is intended to be sourced into your .zshrc file.

# TODO: Autoloading of all component functions?
# Swaths may be unused by configuration, and some components are independently useful.


# Symbols.

# Internals
local s_=" "

# Left/right inter-color (edge) and same-color (level) section separators.
local s_l, s_r, s_L, s_R

# Pretty working directory symbols.
local s_pwd_root s_pwd_home s_pwd_vroot s_pwd_venv s_pwd_project

# SCM components.
local s_scm_branch s_scm_added s_scm_removed s_scm_changed

# SCM states.
local s_scm_clean s_scm_dirty s_scm_equal s_scm_push s_scm_pull s_scm_both


# Theme components.

# Internal
local c_e="\033[" c_E="m"
local c_n="%{" c_N="%}"
local c_w="${c_n}${c_e}" c_W="${c_E}${c_N}"
local c_r="${c_w}0${c_W}"
local c_rbg="${c_w}49${c_W}"





# Exported configurable globals and results.

# Extend this with your own, in precedence order for path abbreviation.
# For example, if your home folder is nothing but projects, reset __jarco_project_locations to just ($HOME).
# If you use something more complicatd, e.g.: https://softwareengineering.stackexchange.com/a/14609 you will
# want to write a proper searcher instead.
global -A __jarco_projects
global -A __jarco_project_searchers_explicit=(vroot python_venv node_venv)
global -A __jarco_project_searchers_implicit=(scm personal)
global -A __jarco_project_locations=("$HOME/Projects" "$HOME/Documents/Projects" "$HOME/proj")




[[ -o interactive ]]

