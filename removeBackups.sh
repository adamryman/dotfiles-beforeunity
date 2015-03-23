# Adam Ryman
# Remove backup files that setup.sh created

# Once system is confirmed working run this file to remove backups that were created

find ~ -name *~~backup-dotfile~~ -delete
