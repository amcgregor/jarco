function _jarco_prompt__host {
	# Contribute the current hostname.
	parts+=(("${c_prompt_host}" "$(hostname ${__jarco_prompt__host_options:'-s'})"))
}
