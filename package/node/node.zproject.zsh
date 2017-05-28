function _jarco_project__node_venv {
	# Search for the VIRTUAL_ENV environment variable from Node venv.
	[ $NODE_VIRTUAL_ENV ] || return
	__jarco_projects+=(("$s_pwd_venv", "${NODE_VIRTUAL_ENV}", "${NODE_VIRTUAL_ENV:t}"))
}
