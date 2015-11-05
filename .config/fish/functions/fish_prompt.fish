set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showstashstate 1
set __fish_git_prompt_showupstream "auto"
set __fish_git_prompt_char_dirtystate "±"
set __fish_git_prompt_show_upstream 1
set __fish_git_prompt_char_cleanstate ''
set __fish_git_prompt_char_stateseparator ""

set -g current_bg NONE
set segment_separator \uE0B0
set right_segment_separator \uE0B0

function prompt_segment -d "Function to draw a segment"
  set -l bg
  set -l fg
  if [ -n "$argv[1]" ]
    set bg $argv[1]
  else
    set bg normal
  end
  if [ -n "$argv[2]" ]
    set fg $argv[2]
  else
    set fg normal
  end
  if [ "$current_bg" != 'NONE' -a "$argv[1]" != "$current_bg" ]
    set_color -b $bg
    set_color $current_bg
    echo -n "$segment_separator "
    set_color -b $bg
    set_color $fg
  else
    set_color -b $bg
    set_color $fg
    echo -n " "
  end
  set current_bg $argv[1]
  if [ -n "$argv[3]" ]
    echo -n -s $argv[3] " "
  end
end

function right_prompt -d "Function to draw a right prompt"
  set -l bg
  set -l fg
  if [ -n "$argv[1]" ]
    set bg $argv[1]
  else
    set bg normal
  end
  if [ -n "$argv[2]" ]
    set fg $argv[2]
  else
    set fg normal
  end
  set_color -b 000000
  set_color $bg
  echo -n ""
  set_color -b $bg
  set_color $fg
  if [ -n "$argv[3]" ]
    echo -n -s " " $argv[3] " "
  end
end

function prompt_finish -d "Close open segments"
  if [ -n $current_bg ]
    set_color -b normal
    set_color $current_bg
    echo -n "$segment_separator "
  end
  set -g current_bg NONE
end

function prompt_status -d "the symbols for a non zero exit status, root and background jobs"
	set -l last_status $status

	set -g current_bg NONE

	set -l status_string ""
    if [ $last_status -ne 0 ]
		set status_string $status_string(set_color red)"✘"
    end

    # if superuser (uid == 0)
    set -l uid (id -u $USER)
    if [ $uid -eq 0 ]
		set status_string $status_string(set_color yellow)"⚡"
    end

    # Jobs display
    if [ (jobs -l | wc -l) -gt 0 ]
		set status_string $status_string(set_color cyan)"⚙"
    end
	prompt_segment 202020 cyan "$status_string"
end

function fish_prompt --description 'Write out the prompt'
	prompt_status

    set branch_symbol \uE0A0

	prompt_segment 303030 white (my_prompt_pwd)

	set -l git_status (__fish_git_prompt "$branch_symbol %s")

	prompt_segment yellow black "$git_status"

	prompt_finish

	set_color normal
end

function fish_right_prompt
	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	set user_host "$USER@$__fish_prompt_hostname"

	right_prompt ffff00 blue $user_host
	set_color normal
end

