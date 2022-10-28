#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Delete mail group in iRedMail.
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
echo " Enter e-mail to DELETE mail group:"
echo " For example: mail@domain.com"
echo
read EMAIL_GRP


# If iRedMail have a few domain, replace domain.com for your defaul domain
echo
read -e -p "Enter domain to new mail group:" -i "$DOMAIN_DEF"  DOMAIN_GRP
echo


        echo
        echo " ---  DELETE mail group: "
        echo " ---  $EMAIL_GRP"
        echo " ---  Domain $DOMAIN_GRP"
        echo
        echo
	echo
	read -p "All ok, DELETE? (y|n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# DELETE MAIL GROUP
	sudo -u postgres psql -d vmail -c "DELETE from alias WHERE address='$EMAIL_GRP' ;"
else
        echo
        echo " Ok, next time! "
        echo
fi