Creation of the Cronjob
- the cronjob is create to make regular backups once at between 00 : 00 and 01 : 00.
- it is created to make buckups of postgres database data.
- integrated with amazon-s3 bucket
- docker image that we used
- https://github.com/schickling/dockerfiles/tree/master/postgres-backup-s3

Valid parameters for postgres-s3-backup
Parameter                 | Values
---------------------------------------------------------------------------------------------------------------------------------------------------------------- 
- schedule                  | '@daily'  *** set the schedule for the cronjob to run at e.g ' 0 0 */1 * *' will run every day at 00 : 00
- s3.region                 | region *** which region is the S3 bucket set
- s3.bucket                 | my-bucket *** set the bucket name in order to know where the buckups should be saved
- s3.prefix                 | backup *** (optional) if you want to create a folder that you want to store your backups in, you will use prefix for such a use case
- s3.secret.name            | secret name *** the name of the secret that you created for storing the access key id and secret access key
- s3.secret.accessKeyIdKey  | accessKeyIdKey *** the access key id to get access to the AWS s3 bucket
- s3.secret.secretAccessKey | secretAccessKey *** the secret access key to allow you access to the AWS s3 bucket
- postgres.database         | dbname *** specifies the database name that will be backedup 
- postgres.user             | user *** the username you use to access the postgres database
- postgres.extraOpts        | '--schema=public --blobs' *** specifies any extra options that you might want to pass
- postgres.host             | host *** specify the host of the postgres database pod that holds the postgres database data
- postgres.secret.name      | secret name *** name of the postgres secret that needs to be referenced to
- postgres.secret.password  | password *** password that is needed to make use of the postgres database
-----------------------------------------------------------------------------------------------------------------------------------------------------------------