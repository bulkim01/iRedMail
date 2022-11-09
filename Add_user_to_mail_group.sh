#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Add user to mail group in iRedMail.
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

echo "Enter users e-mail to add in mail group:"
echo " For example: user"
echo
read EMAIL_USR

#------------------------------------------------------------------
        echo
        echo " ---  Add user to mail group"
        echo " ---  Users e-mail - $EMAIL_USR@$DOMAIN_GRP"
        echo " ---  Mail Group - $EMAIL_GRP@$DOMAIN_GRP"
        echo
        echo
	echo
	read -p "All ok, add? (y|n)" -n 1 -r

#------------------------------------------------------------------
if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# ADD USER TO MAIL GROUP
	sudo -u postgres psql -d vmail -c "INSERT INTO forwardings (address, forwarding, domain, dest_domain, is_list, active)
	VALUES ('$EMAIL_GRP@$DOMAIN_GRP', '$EMAIL_USR@$DOMAIN_GRP', '$DOMAIN_GRP', '$DOMAIN_GRP', 1, 1);"
else
        echo
        echo " Ok, next time! "
        echo
fi