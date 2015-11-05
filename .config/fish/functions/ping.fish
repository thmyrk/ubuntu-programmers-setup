#!/usr/local/bin/fish

function ping
    if [ "$argv" = "" ]
        /bin/ping 8.8.8.8
    else
        /bin/ping "$argv"
    end
end
