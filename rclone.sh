#download rclone
sudo mv rclone /usr/local/bin/
rclone config #configure rclone and connect to api's
nano /Users/kamil/.config/rclone/rclone.conf 
rclone lsd S3:kamils-backups/
rclone --transfers=32 --checkers=16 --no-traverse --drive-chunk-size=16384k --drive-upload-cutoff=16384k --stats=50s copy GD-PRIVATE: S3:kamils-backups/rclone-gd-private
rclone --transfers=32 --checkers=16 --no-traverse --drive-chunk-size=16384k --drive-upload-cutoff=16384k --stats=50s copy GD-TIMECAMP: S3:kamils-backups/rclone-gd-timecamp

#/Users/kamil/.config/rclone/rclone.conf 
[S3]
type = s3
env_auth = false
access_key_id = 
secret_access_key = 
region = eu-west-1
endpoint = 
location_constraint = eu-west-1
acl = private
server_side_encryption = 
storage_class = STANDARD_IA

[GD-PRIVATE]
type = drive
client_id = 
client_secret = 
token = 

[GD-TIMECAMP]
type = drive
client_id = 
client_secret = 
token = 

