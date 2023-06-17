#!/bin/bash

# Check if we are root privilage or not
if [[ $UID -ne 0 ]]
then
        echo "Please run this script with superuser privileges."
        exit 1
fi
# Define the backup directory
BACKUP_DIR="/mnt/backup"
# Define the directories to be backed up
DIRECTORIES=("/home/ec2-user/data")
# Get the hostname of the instance
HOSTNAME=$(hostname -s)
# Get the current date and time
DATE=$(date +%F-%H-%M)
# Print start status message.
echo "We will back up ${DIRECTORIES[@]} to under ${BACKUP_DIR}"
# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi
# Iterate through the directories to be backed up
for DIR in "${DIRECTORIES[@]}"
do
    # Create the filename for the backup
    FILENAME="$BACKUP_DIR/$HOSTNAME-$DATE-$(basename $DIR).tgz"
    tar -zcvf "$FILENAME" "$DIR"
done
# Or if you have only one directory that you know.

# Run "sed -i -e 's/\r$//' scriptname.sh" command before running script.

# Print end status message.
echo "Back up is ready."
