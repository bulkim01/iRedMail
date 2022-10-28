!/bin/bash
#
# Author:       Kilo300
# Purpose:      Show users in mail group.
# License:      MIT License
#
# Run this scripts under root, or any user who can run sudo -u postgres

echo
echo "There are mailing groups:"
echo
sudo -u postgres psql -d vmail -c "select address, name from alias;"
echo "=================================================="
echo
echo " Enter e-mail to new mail group:"
echo " For example: mail@domain.com"
echo
read EMAIL_GRP


sudo -u postgres psql -d vmail -c "select forwarding from forwardings where address = '$EMAIL_GRP';"