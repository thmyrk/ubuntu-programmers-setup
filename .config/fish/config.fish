set -g theme_display_user yes
set -g default_user dummyasdfasdfasljoi

function __fish_paginate -d "Paginate the current command using the users default pager"

	set -l cmd less
	if set -q PAGER
		set cmd $PAGER
	end

	if commandline -j|grep -v "$cmd *\$" >/dev/null
		commandline -aj "|$cmd"
	end
	commandline -f execute

end

function my_prompt_pwd --description 'Print the current working directory with colored repository path'
	if git rev-parse --is-inside-work-tree > /dev/null 2>&1;
		echo (git rev-parse --show-toplevel | sed -e "s|^$HOME|~|")"/"(set_color 008800)(git rev-parse --show-prefix)"$__fish_prompt_cwd"
	else
		echo $PWD  | sed -e "s|^$HOME|~|"
	end
end
