
# Use GRC only for following commands

set -U grc_plugin_execs cat cvs df diff dig gcc g++ ifconfig \
       make mount mtr netstat ps tail traceroute \
       wdiff blkid du dnf docker docker-machine env id ip iostat \
       last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap \
       fdisk findmnt free semanage sar ss sysctl systemctl stat showmount tune2fs \
       tcpdump tune2fs \
       vmstat w who

for executable in $grc_plugin_execs
    if type -q $executable
        alias $executable "grc $executable"
    end
end

