!/bin/bash
#
# Author:       Kilo300
# Purpose:      Show users in mail group.
# License:      MIT License
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


sudo -u postgres psql -d vmail -c "select forwarding from forwardings where address = '$EMAIL_GRP@$DOMAIN_GRP';"
