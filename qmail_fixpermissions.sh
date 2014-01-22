#!/bin/sh
if [ "$(whoami)" != "root" ];
 then
   echo "Needs to be run as root, [x]"
   exit 1
else

echo "This little script will fix your qmail permissions (if broken)!"
echo "Please enter the path to qmail (default: /var/qmail)"
read dir
dir=${dir:=/var/qmail}

echo "using $dir..."
echo "Please enter the username for your maildaemon (default: popuser)"
read xuser
xuser=${xuser:=popuser}
echo "using $xuser..."
echo "fixing users"
chown $xuser:$xuser $dir/mailnames -R $*
echo "fixing permissions"
chmod 0775 $dir/mailnames -R $*
echo "done"
exit 0
fi
