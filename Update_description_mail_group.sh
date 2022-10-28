#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Update description mail group in iRedMail.
# License: 	MIT License
#
# Run this scripts under root, or any user who can run sudo -u postgres

DOMAIN_DEF=domain.com

echo
echo "There are mailing groups:"
echo
sudo -u postgres psql -d vmail -c "select address, name from alias;"
echo "=================================================="
echo
echo " Enter e-mail groups:"
echo
read EMAIL_GRP

echo -n "Enter new description to mail group:"
echo
read 'DESCR_GRP'

# If iRedMail have a few domain, replace domain.com for your defaul domain
echo
read -e -p "Enter domain mail group:" -i "$DOMAIN_DEF" 'DOMAIN_GRP'
echo

        echo
        echo " ---  UPDATE descriptoin mail group: "
        echo " ---  E-mail - $EMAIL_GRP"
        echo " ---  NEW Description - $DESCR_GRP"
        echo " ---  Domain $DOMAIN_GRP"
        echo
        echo
	echo
	read -p "All ok, update? (y|n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# CREATE MAIL GROUP
	sudo -u postgres psql -d vmail -c "UPDATE alias SET name = '$DESCR_GRP' WHERE address='$EMAIL_GRP';"
else
        echo
        echo " Ok, next time! "
        echo
fi