#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Delete user from mail group in iRedMail.
# License: 	MIT License
#
# Run this scripts under root, or any user who can run sudo -u postgres


DOMAIN=domain.com
echo
echo "Default mail domain=$DOMAIN"
echo "Change this in script"
echo
read -e -p "Mail domain:" -i "$DOMAIN"  DOMAIN_GRP
echo

#------------------------------------------------------------------
echo
echo "There are mailing groups:"
echo
sudo -u postgres psql -d vmail -c "select address, name from alias;"
echo "=================================================="
echo
echo " Enter mail group:"
echo " For example: office"
echo
read EMAIL_GRP

echo "Enter user e-mail"
echo " For example: user"
echo
read EMAIL_USR

#------------------------------------------------------------------
        echo
        echo " ---  Delete user from mail group"
        echo " ---  Users e-mail - $EMAIL_USR@$DOMAIN_GRP"
        echo " ---  Mail Group - $EMAIL_GRP@$DOMAIN_GRP"
        echo
        echo
	echo
	read -p "All ok, DELETE? (y|n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
	then
	# DELETE USER FROM MAIL GROUP
	sudo -u postgres psql -d vmail -c "DELETE from forwardings WHERE address='$EMAIL_GRP@$DOMAIN_GRP' and forwarding='$EMAIL_USR@$DOMAIN_GRP'";		

else
        echo
        echo " Ok, next time! "
        echo
fi