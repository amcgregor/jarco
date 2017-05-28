function _jarco_prompt__exit {
	# Render the last exit status.
	[[ $__jarco__exit_status -eq 0 ]] && return
	parts+=(("${c_exit}" "${__jarco__exit_status}"))
}
