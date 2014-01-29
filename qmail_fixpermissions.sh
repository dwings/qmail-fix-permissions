#!/bin/sh
if [ "$(whoami)" != "root" ];
 then
   echo "Needs to be run as root, [x]"
   exit 1
else
	echo "This little script will fix your qmail permissions (if broken)!"
	echo -n "Please enter the path to qmail (default: /var/qmail): "; 
	read dir
	dir=${dir:=/var/qmail}
	echo "Using: $dir"
	
	echo -n "checking path for qmail installation..."
	sleep 1s
	if [ ! -f $dir/bin/qmail-start ];
	then
	   echo "Could not find qmail installation in $dir"
	   exit 0
	fi
	echo "success"
	echo -n "Please enter the username for your maildaemon (default: popuser): "; read xuser
	xuser=${xuser:=popuser}
	echo "Using: $xuser"
	
	echo -n "fixing users..."
	sleep 2s
	chown $xuser:$xuser $dir/mailnames -R $*
	echo "done"
	echo -n "fixing permissions..."
	sleep 2s
	chmod 0775 $dir/mailnames -R $*
	find $dir/mailnames -name ".qmail*" -exec chmod 600 {} \; -print
	echo "done"
	exit 0
fi
