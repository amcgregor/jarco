function _jarco_project__scm {
	# Utilize "active SCM" search to identify a project.
	__jarco_scm || return
	__jarco_projects+=(("$s_pwd_scm", "${__jarco_scm__path}", "${__jarco_scm__path:t}"))
}
