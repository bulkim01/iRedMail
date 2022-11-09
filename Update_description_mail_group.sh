#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Update description mail group in iRedMail.
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
echo " Enter e-mail groups:"
echo " For example: office"
echo
read EMAIL_GRP

echo -n "Enter new description to mail group:"
echo
read 'DESCR_GRP'

#------------------------------------------------------------------
        echo
        echo " ---  UPDATE descriptoin mail group: "
        echo " ---  E-mail - $EMAIL_GRP@$DOMAIN_GRP"
        echo " ---  NEW Description - $DESCR_GRP"
        echo
        echo
	echo
	read -p "All ok, update? (y|n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
	then
	# UPDATE DISCRIPTION MAIL GROUP
	sudo -u postgres psql -d vmail -c "UPDATE alias SET name = '$DESCR_GRP' WHERE address='$EMAIL_GRP@$DOMAIN_GRP';"
else
        echo
        echo " Ok, next time! "
        echo
fi