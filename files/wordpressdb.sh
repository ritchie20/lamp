#!/bin/bash

mysql -u root -phandl3bur -e "create user 'testeando'@'localhost' IDENTIFIED BY 'wordpress'; create database if not exists wordpressdb; grant all privileges on wordpressdb.* to 'wordpress'@'localhost';"