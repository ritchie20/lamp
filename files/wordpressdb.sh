#!/bin/bash

mysql -u root -phandl3bur -e "create user 'wordpress'@'localhost' IDENTIFIED BY 'wordpresspass'; create database if not exists wordpressdb; grant all privileges on wordpressdb.* to 'wordpress'@'localhost';"
