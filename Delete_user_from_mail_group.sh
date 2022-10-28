#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Delete user from mail group in iRedMail.
# License: 	MIT License
#
# Run this scripts under root, or any user who can run sudo -u postgres

echo
echo "There are mailing groups:"
echo
sudo -u postgres psql -d vmail -c "select address, name from alias;"
echo "=================================================="
echo
echo " Enter e-mail mail group:"
echo
read EMAIL_GRP

echo "Enter users e-mail"
echo " For example: user@domain.com"
echo
read EMAIL_USR


        echo
        echo " ---  Delete user from mail group"
        echo " ---  Users e-mail - $EMAIL_USR"
        echo " ---  Mail Group - $EMAIL_GRP"
        echo
        echo
	echo
	read -p "All ok, DELETE? (y|n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
	then
	# DELETE USER FROM MAIL GROUP
	sudo -u postgres psql -d vmail -c "DELETE from forwardings WHERE address='$EMAIL_GRP' and forwarding='$EMAIL_USR'";		

else
        echo
        echo " Ok, next time! "
        echo
fi