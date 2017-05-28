function _jarco_project__vroot {
	# Search for the VIRTUAL_ROOT environment variable, an absolute path.
	[ $VIRTUAL_ROOT ] || return
	__jarco_projects+=(("$s_pwd_vroot", "${VIRTUAL_ROOT}", "${VIRTUAL_ROOT:t}"))
}
