#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Create mail group in iRedMail.
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
echo " Enter e-mail to new mail group:"
echo " For example: office"
echo
read EMAIL_GRP

echo -n "Enter description to new mail group:"
echo
read DESCR_GRP

#------------------------------------------------------------------
        echo
        echo " ---  Create mail group: "
        echo " ---  E-mail - $EMAIL_GRP@$DOMAIN_GRP"
        echo " ---  Description - $DESCR_GRP"
        echo
        echo
	echo
	read -p "All ok, create? (y|n)" -n 1 -r

#------------------------------------------------------------------
if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# CREATE MAIL GROUP
	sudo -u postgres psql -d vmail -c "INSERT INTO alias (address, name, domain, active) 
VALUES ('$EMAIL_GRP@$DOMAIN_GRP', '$DESCR_GRP', '$DOMAIN_GRP', 1);"

else
        echo
        echo " Ok, next time! "
        echo
fi