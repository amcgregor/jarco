function _jarco_prompt__user {
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
