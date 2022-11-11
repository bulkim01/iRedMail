#!/bin/bash
#
# Author: 	Kilo300
# Purpose: 	Show mail users in iRedMail.
# License: 	MIT License
#
# Run this scripts under root, or any user who can run sudo -u postgres

echo
echo "There are mail users:"
echo
sudo -u postgres psql -d vmail -c "SELECT username FROM mailbox ORDER BY created;"
