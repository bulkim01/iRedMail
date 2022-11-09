#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Delete mail group in iRedMail.
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
echo " Enter e-mail to DELETE mail group:"
echo " For example: office"
echo
read EMAIL_GRP

#------------------------------------------------------------------
        echo
        echo " ---  DELETE mail group: "
        echo " ---  $EMAIL_GRP@$DOMAIN_GRP"
        echo
        echo
	echo
	read -p "All ok, DELETE? (y|n)" -n 1 -r

#------------------------------------------------------------------
if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# DELETE MAIL GROUP
	sudo -u postgres psql -d vmail -c "DELETE from alias WHERE address='$EMAIL_GRP@$DOMAIN_GRP' ;"
else
        echo
        echo " Ok, next time! "
        echo
fi