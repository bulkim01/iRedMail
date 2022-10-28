#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Add user to mail group in iRedMail.
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
echo " Enter e-mail mail group:"
echo
read EMAIL_GRP

echo "Enter users e-mail to add in mail group:"
echo " For example: user@domain.com"
echo
read EMAIL_USR


# If iRedMail have a few domain, replace domain.com for your defaul domain
echo
read -e -p "Enter domain to new mail group:" -i "$DOMAIN_DEF" DOMAIN_GRP
echo

        echo
        echo " ---  Add user to mail group"
        echo " ---  Users e-mail - $EMAIL_USR"
        echo " ---  Mail Group - $EMAIL_GRP"
        echo " ---  Domain $DOMAIN_GRP"
        echo
        echo
	echo
	read -p "All ok, add? (y|n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# ADD USER TO MAIL GROUP
	sudo -u postgres psql -d vmail -c "INSERT INTO forwardings (address, forwarding, domain, dest_domain, is_list, active)
	VALUES ('$EMAIL_GRP', '$EMAIL_USR', '$DOMAIN_GRP', '$DOMAIN_GRP', 1, 1);"
else
        echo
        echo " Ok, next time! "
        echo
fi