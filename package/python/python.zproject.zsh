function _jarco_project__python_venv {
	# Search for the VIRTUAL_ENV environment variable from Python venv.
	[ $VIRTUAL_ENV ] || return
	__jarco_projects+=(("$s_pwd_venv", "${VIRTUAL_ENV}", "${VIRTUAL_ENV:t}"))
}
