#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.
read -p "Enter your name  :" name
read -p "Enter user name  :" username 
read -sp "Enter your password :" password 
# Make sure the script is being executed with superuser privileges.

# Get the username (login).
useradd -m -c "$name" $username
# Get the real name (contents for the description field).

# Get the password.
passwd $username 

# Create the account.

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.

# Set the password.

# Check to see if the passwd command succeeded.

# Force password change on first login.

# Display the username, password, and the host where the user was created.

echo "your username  :" $username
echo -e "your password  :" $password
echo su $username $HOSTNAME
# If you get bad interpreter error: "sed -i -e 's/\r$//' <script_name>" command first.
