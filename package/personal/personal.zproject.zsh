function _jarco_project__personal {
	# Utilize the project search path to identify if any exist, and add them as candidates.
	(( ${#__jarco_project_locations} > 0 )) || return
	
	local base candidate
	
	# TODO: Iterate, compare to CWD and add.
	#__jarco_projects+=(("$s_pwd_project", "${candidate}", "${candidate:t}"))
}
