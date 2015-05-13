#!/bin/bash

# path configs
HOME_PATH="/root"
GDRIVE_PATH="$HOME_PATH/gdrive"
BACKUP_PATH="$GDRIVE_PATH/backups"
TMP_PATH="$GDRIVE_PATH/.tmp_backups"
WWW_PATH="/var/www/top3dshop/data/www/top3dshop.ru"

# backup file configs
BACKUP_HOSTNAME=`hostname` # used for naming the backup file
BACKUP_DATE=`date -I`

# cloud providers
GDRIVE_BACKUP=1

# auto cleanup
DELETE_BACKUPS=1
DELETE_EVERY=60 # delete backups every X days

# mysql
MYSQL_BACKUP=1
MYSQL_USER="top"
MYSQL_PASS="to6FrZ2M"

WWW_BACKUP=1

# check for backup folder
if [ ! -d "$BACKUP_PATH" ]; then
    echo -e "Attempting to create backup folder: $BACKUP_PATH"
    mkdir -p $BACKUP_PATH > /dev/null 2>&1
    if [ ! -d "$BACKUP_PATH" ]; then
        echo -e "Could not create backup folder: $BACKUP_PATH"
        exit 0
    fi
    echo -e "Successfully created backup folder: $BACKUP_PATH"
fi

# check for tmp folder
if [ ! -d "$TMP_PATH" ]; then
    echo -e "Attempting to create tmp folder: $TMP_PATH"
    mkdir -p $TMP_PATH > /dev/null 2>&1
    if [ ! -d $TMP_PATH ]; then
        echo -e "Could not create tmp folder: $TMP_PATH"
        exit 0
    fi
    echo -e "Successfully created tmp folder: $TMP_PATH"
fi

# remove backups after X days
if [ $DELETE_BACKUPS -eq 1 ]; then
    echo -e "Deleting backup files older than $DELETE_EVERY days"
    find $BACKUP_PATH -type f -mtime $DELETE_EVERY -exec rm -f {} \;
fi

# backup mysql
if [ $MYSQL_BACKUP -eq 1 ]; then
    echo -e "Compressing mysql databases to temp folder"
    mysqldump -u $MYSQL_USER -p $MYSQL_PASS --all-databases | gzip > $TMP_PATH/mysql_backup.sql.gz > /dev/null 2>&1
fi

# backup www
if [ $WWW_BACKUP -eq 1 ] && [ -d $WWW_PATH ]; then
    echo -e "Compressing top3dshop folder to temp folder"
    tar -cvzpf $TMP_PATH/top3dshop_backup.tar.gz $WWW_PATH > /dev/null 2>&1
fi

echo -e "Combine all backup files into a single tar.gz file"

tar -cvzf $BACKUP_PATH/daily_backup_$BACKUP_DATE.tar.gz -C $TMP_PATH $(ls -A $TMP_PATH) > /dev/null 2>&1


# google drive
if [ "$GDRIVE_BACKUP" -eq 1 ]; then
    GDRIVE_TAR="$GDRIVE_PATH/daily_backup.${BACKUP_HOSTNAME}.tar.gz"
    if [ -d "$GDRIVE_PATH" ]; then
        echo -e "Copy latest backup tar.gz file into Google Drive folder"
        cp $BACKUP_PATH/daily_backup_$BACKUP_DATE.tar.gz $GDRIVE_TAR
    fi
fi

# remove tmp backup files
if [ ! -e "$TMP_PATH/*" ]; then
    echo -e "Deleting contents of tmp_backups"
    find $TMP_PATH -type f -delete
    exit 1
fi
exit 0