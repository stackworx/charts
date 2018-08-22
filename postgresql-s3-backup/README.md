Creation of the Cronjob
- the cronjob is create to make regular backups once at between 00 : 00 and 01 : 00.
- it is created to make buckups of postgres database data.
- integrated with amazon-s3 bucket
- docker image that we used
- https://github.com/schickling/dockerfiles/tree/master/postgres-backup-s3

Valid parameters for postgres-s3-backup
Parameter                     | Description                                                                                                                | Default
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
- schedule                     | set the schedule for the cronjob to run at e.g ' 0 0 */1 * *' will run every day at 00 : 00                               | nil
- s3.region                    | which region is the S3 bucket set                                                                                         | eu-west-2
- s3.bucket                    | set the bucket name in order to know where the buckups should be saved                                                    | stackworx-k8-dev-database-backup
- s3.prefix                    | (optional) if you want to create a folder that you want to store your backups in, you will use prefix for such a use case | nil
- s3.secret.name               | the name of the secret that you created for storing the access key id and secret access key                               | nil
- s3.secret.passwordKey        | the password key to get access to the AWS s3 bucket                                                                       | access_key_id
- s3.secret.secretpasswordKey  | the secret password key to allow you access to the AWS s3 bucket                                                          | secret_access_key
- postgres.database            | specifies the database name that will be backedup                                                                         | postgres   
- postgres.user                | the username you use to access the postgres database                                                                      | postgres
- postgres.extraOpts           | specifies any extra options that you might want to pass                                                                   | nil
- postgres.host                | specify the host of the postgres database pod that holds the postgres database data                                       | nil 
- postgres.secret.name         | name of the postgres secret that needs to be referenced to                                                                | nil  
- postgres.password            | password that you created to access the postgres database                                                                 | nil  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------