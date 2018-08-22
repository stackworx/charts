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
- s3.region               | region *** which region is the S3 bucket set
- s3.accessKeyId          | key *** the access key id to the S3 bucket that you have (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
- s3.secretAccessKey      | secret *** the secret access key to the S3 bucket (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
- s3.bucket               | my-bucket *** set the bucket name in order to know where the buckups should be saved
- s3.prefix               | backup *** (optional) if you want to create a folder that you want to store your backups in, you will use prefix for such a use case
- s3.secret               | secret name *** the name of the secret that you created for storing the access key id and secret access key
- postgres.database       | dbname *** specifies the database name that will be backedup 
- postgres.user           | user *** the username you use to access the postgres database
- postgres.password       | password *** the password that you use enter the database (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
- postgres.extraOpts      | '--schema=public --blobs' *** specifies any extra options that you might want to pass
- postgres.host           | host *** specify the host of the postgres database pod that holds the postgres database data
- postgres.secret         | secret name *** name of the postgres secret that needs to be referenced to
-----------------------------------------------------------------------------------------------------------------------------------------------------------------