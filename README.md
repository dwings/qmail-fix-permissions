qmail-fix-permissions
=====================

A script to fix the permissions of qmail, after restoring or transferring mailaccounts
The script needs to be runned as root!

Usage: ./qmail_fixpermissions.sh [ -v output a diagnostic for every file processed ]

You will be asked about the qmail directory (default: /var/qmail) and the username of your maildaemon (default: popuser). If you are no root, the script will exit.

Use "wget https://raw2.github.com/dwings/qmail-fix-permissions/master/qmail_fixpermissions.sh" to get the latest version
