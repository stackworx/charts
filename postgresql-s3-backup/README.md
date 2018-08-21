Creation of the Cronjob
- the cronjob is create to make regular backups once at between 00 : 00 and 01 : 00.
- it is created to make buckups of postgres database data.
- integrated with amazon-s3 bucket
- docker image that we used
- https://github.com/schickling/dockerfiles/tree/master/postgres-backup-s3

Valid parameters for postgres-s3-backup
Parameter                 | Values
---------------------------------------------------------------------------------------------------------------------------------------------------------------- 
- schedule                | '@daily'  *** set the schedule for the cronjob to run at e.g ' 0 0 */1 * *' will run every day at 00 : 00
- s3_region               | region *** which region is the S3 bucket set
- s3_access_key_id        | key *** the access key id to the S3 bucket that you have (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
- s3_secret_access_key    | secret *** the secret access key to the S3 bucket (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
- s3_bucket               | my-bucket *** set the bucket name in order to know where the buckups should be saved
- s3_prefix               | backup *** (optional) if you want to create a folder that you want to store your backups in, you will use prefix for such a use case
- postgres_database       | dbname *** specifies the database name that will be backedup 
- postgres_user           | user *** the username you use to access the postgres database
- postgres_password       | password *** the password that you use enter the database (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
- postgres_extra_opts     | '--schema=public --blobs' *** specifies any extra options that you might want to pass
- postgres_host           | host *** specify the host of the postgres database pod that holds the postgres database data
-----------------------------------------------------------------------------------------------------------------------------------------------------------------