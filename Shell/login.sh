#!/bin/bash
# Ask the user for login details
read -p "Username: " username # p specifies a prompt
read -sp "Password: " password # s makes input silent
echo "Thank you, "${username}"! We have your login details"
