function mvn

#	set -l BOLD (tput bold)
#	set -l UNDERLINE_ON (tput smul)
#	set -l UNDERLINE_OFF (tput rmul)
#	set -l TEXT_BLACK (tput setaf 0)
#	set -l TEXT_RED (tput setaf 1)
#	set -l TEXT_GREEN (tput setaf 2)
#	set -l TEXT_YELLOW (tput setaf 3)
#	set -l TEXT_BLUE (tput setaf 4)
#	set -l TEXT_MAGENTA (tput setaf 5)
#	set -l TEXT_CYAN (tput setaf 6)
#	set -l TEXT_WHITE (tput setaf 7)
#	set -l BACKGROUND_BLACK (tput setab 0)
#	set -l BACKGROUND_RED (tput setab 1)
#	set -l BACKGROUND_GREEN (tput setab 2)
#	set -l BACKGROUND_YELLOW (tput setab 3)
#	set -l BACKGROUND_BLUE (tput setab 4)
#	set -l BACKGROUND_MAGENTA (tput setab 5)
#	set -l BACKGROUND_CYAN (tput setab 6)
#	set -l BACKGROUND_WHITE (tput setab 7)
#	set -l RESET_FORMATTING (tput sgr0)
#
    set -l __bell_last_time (date +%s)
#	begin
		~/bin/mvn -T2.0C -Prun-tests-in-parallel $argv
		set ret $status
#	end | sed -u -e "s/\(\[INFO\]\)/$TEXT_BLUE$BOLD\1$RESET_FORMATTING/g"
#		-e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/${BOLD}${TEXT_GREEN}\1${RESET_FORMATTING}/g" \
#		-e "s/\(\[WARNING\].*\)/${BOLD}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
#		-e "s/\(\[ERROR\].*\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g"
#		-e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${BOLD}${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${BOLD}${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${BOLD}${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${BOLD}${TEXT_YELLOW}\4${RESET_FORMATTING}/g"

    if expr (date "+%s") "-" "$__bell_last_time" ">=" "10" > /dev/null
        if [ "$ret" = 0 ]
            nohup ogg123 /usr/share/sounds/KDE-Im-Sms.ogg >/dev/null 2>&1 &
        else
            nohup ogg123 /usr/share/sounds/KDE-Im-Error-On-Connection.ogg >/dev/null 2>&1 &
        end
    end
    return $ret
end
