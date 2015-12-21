#!/bin/bash

mysql -u root -phandl3bur << EOF

#creating the wordpress user
'wordpress'@'localhost' IDENTIFIED BY 'wordpress';

EOF